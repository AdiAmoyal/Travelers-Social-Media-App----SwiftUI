//
//  Home.swift
//  LoginProject
//
//  Created by Adi Amoyal on 16/02/2023.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    @State var width = UIScreen.main.bounds.width
    @State var selected = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            HeaderNavigationBar(selected: $selected)
            
            Spacer()
            
            switch selected {
            case "search":
                SearchBar()
            case "notifications":
                Notifications()
            default:
                Text("Home")
                    .font(.title)
                
                Spacer()
                
                Button(action: authModel.signOut) {
                    Text("SIGNOUT")
                }
                .padding(.bottom, 50)
            }
            
            
        }
        .ignoresSafeArea(.all)
        .statusBarHidden(true)
        .background(Colors.backgroundColor)
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(AuthViewModel())
    }
}
