//
//  SignupViewModel.swift
//  LoginProject
//
//  Created by Adi Amoyal on 16/02/2023.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestore

class SignupViewModel: ObservableObject {
    let firebaseModel = FirebaseModel(
    )
    // MARK: View Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var verifyPassword: String = ""
    @Published var fullName: String = ""
    
    // MARK: Error Properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isLoading: Bool = false
    
    func createUser() {
        self.isLoading = true
        let user = UserModel()
        user.email = self.email
        user.fullName = self.fullName
        
        if (password == verifyPassword) {
            firebaseModel.createUser(email: email, password: password) { success in
                if success == true {
                    self.firebaseModel.addUser(user: user) {
                        self.isLoading = false
                        print("User successfuly saved")
                    }
                }
            }
        } else {
            self.isLoading = false
            print("Passwords doesn't match")
        }
    }
    
    func addUser(_ user: UserModel, completion: @escaping ()->Void) {
        Firestore.firestore().collection("Users").document(user.email!)
            .setData(user.toJson()) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with")
            }
            completion()
        }
    }
    
    func handleError(error: Error) async {
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            self.isLoading = false
            showError.toggle()
        })
    }
}
