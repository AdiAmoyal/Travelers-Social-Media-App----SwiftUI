//
//  Profile.swift
//  LoginProject
//
//  Created by Adi Amoyal on 21/02/2023.
//

import SwiftUI

struct Profile: View {
    @StateObject var authModel: AuthViewModel = .init()
    @State private var email: String?
//    var dropdownMenuOptions = [
//        DropdownMenuOption(option: "Edit", image: "paintbrush"),
//        DropdownMenuOption(option: "Saved", image: "star"),
//        DropdownMenuOption(option: "Signout", image: "rectangle.portrait.and.arrow.forward"),
////        DropdownMenuOption(option: "Remove Account", image: "eraser.line.dashed")
//    ]
    
    var body: some View {
        VStack {
//            Header(name: "Adi Amoyal", buttons: [Btn(name: "rectangle.portrait.and.arrow.forward", action: authModel.signOut)], dropdownMenu: true, dropdownMenuOptions: dropdownMenuOptions)
            ScrollView {
                HStack {
                    Button(action: { }) {
                        HStack {
                            Image(systemName: "paintbrush")
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { }) {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(.horizontal, 15)
                .font(.title2)
                
                VStack {
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130, height: 130)
                    
                    Text("Full Name")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(1)
                    
                    Text("Description of the person")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: { }) {
                            ZStack {
                                Rectangle()
                                    .fill(.gray)
                                    .cornerRadius(10)
                                    .frame(width: 110, height: 30)
                                Text("Follow")
                            }
                        }
                        .padding(.horizontal, 5)
                
                        
                        Button(action: { }) {
                            ZStack {
                                Rectangle()
                                    .fill(.gray)
                                    .cornerRadius(10)
                                    .frame(width: 110, height: 30)
                                Text("Message")
                            }
                        }
                        .padding(.horizontal, 5)
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.vertical, 10)
                    
                    HStack {
                        VStack {
                            Text("300")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.bottom, 1)
                            Text("Following")
                                .fontWeight(.light)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("3,5K")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.bottom, 1)
                            Text("Followers")
                                .fontWeight(.light)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("149")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.bottom, 1)
                            Text("Posts")
                                .fontWeight(.light)
                        }
                    }
                    .padding(.horizontal, 35)
                    
                    Divider()
                    
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
