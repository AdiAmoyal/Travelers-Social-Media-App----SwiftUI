//
//  ContentView.swift
//  LoginProject
//
//  Created by Adi Amoyal on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
            if authModel.user != nil {
                Home()
            } else {
                Login()
            }
        }
        .onAppear {
            authModel.listenToAuthState()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
