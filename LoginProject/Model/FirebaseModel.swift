//
//  FirebaseModel.swift
//  LoginProject
//
//  Created by Adi Amoyal on 16/02/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseStorage
import FirebaseAuth


class FirebaseModel{
    
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    // MARK: User functions:
    
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                print("TAG USER \(error)")
                completionBlock(false)
            }
        }
    }
    
    func addUser(user: UserModel, completion: @escaping ()->Void) {
        db.collection("Users").document(user.email!)
            .setData(user.toJson()) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with")
            }
            completion()
        }
    }
    
    func loginUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed due to error:", err)
                completionBlock(false)
            }
            print("Successfully logged in with ID: \(result?.user.uid ?? "")")
            completionBlock(true)
        }
    }
}
