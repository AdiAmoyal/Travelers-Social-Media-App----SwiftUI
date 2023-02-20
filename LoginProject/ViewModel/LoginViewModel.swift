//
//  LoginViewModel.swift
//  LoginProject
//
//  Created by Adi Amoyal on 15/02/2023.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    let fireBaseModel = FirebaseModel()
    // MARK: View Properties
    @Published var isLogin = false
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: Error Properties
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isLoading: Bool = false
    
    func loginUser() {
        self.isLoading = true
        fireBaseModel.loginUser(email: self.email, password: self.password) { success in
            if !success {
                // MARK: Show an error message to the user
            }
            self.isLoading = false
        }
    }
    
    func handleError(error: Error) async {
        await MainActor.run(body: {
            errorMessage = error.localizedDescription
            showError.toggle()
            self.isLoading = false
        })
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
