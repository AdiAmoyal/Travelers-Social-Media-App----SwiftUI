//
//  NavigationBar.swift
//  LoginProject
//
//  Created by Adi Amoyal on 20/02/2023.
//

import SwiftUI

struct NavigationBar: View {
    @Binding var selected: String
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Button(action: {
                    self.selected = "home"
                }) {
                    Image(systemName: self.selected == "home" ? "house.fill" : "house")
                }
                
                Spacer()
                
                Button(action: {
                    self.selected = "search"
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .fontWeight(self.selected == "search" ? .bold : .regular)
                }
                
                Spacer()
                Spacer()
                
                Button(action: {
                    self.selected = "notifications"
                }) {
                    ZStack {
                        Image(systemName: "bell")
                        
                        Circle()
                            .fill(.red)
                            .frame(width: 14, height: 14)
                            .offset(x: 8, y: -10)
                    }
                }
                .offset(x: -3)
                
                Spacer()
                
                Button(action: {
                    self.selected = "profile"
                }) {
                    Image(systemName: self.selected == "profile" ? "person.fill" : "person")
                }
            }
            .foregroundColor(.black)
            .font(.title2)
            .padding()
            .padding(.bottom)
            .padding(.horizontal)
            .background(CurvedShape())
            
            Button(action: {
                self.selected = "newPost"
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding()
            }
            .background(Colors.secondaryOrange)
            .clipShape(Circle())
            .offset(y: -21)
        }
    }
}

//struct NavigationBar_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBar()
//    }
//}
