//
//  HeaderNavigationBar.swift
//  LoginProject
//
//  Created by Adi Amoyal on 20/02/2023.
//

import SwiftUI

struct HeaderNavigationBar: View {
    @Binding var selected: String
    
    var body: some View {
        HStack {
            Text("Travelers")
                .font(.title)
            
            Spacer()
            
            Button(action: {
                self.selected = "search"
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Button(action: {
                self.selected = "notifications"
            }) {
                ZStack {
                    Image(systemName: "bell")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 14, height: 14)
                        .offset(x: 8, y: -10)
                }
                
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom)
        .padding(.top, UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.safeAreaInsets.top)
        .background(.white)
        .shadow(color: .black.opacity(0.04), radius: 5, x: 0, y: 5)
    }
}

//struct HeaderNavigationBar_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderNavigationBar()
//    }
//}
