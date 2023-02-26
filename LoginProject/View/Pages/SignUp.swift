//
//  SignUp.swift
//  LoginProject
//
//  Created by Adi Amoyal on 16/02/2023.
//

import SwiftUI

struct SignUp: View {
    @StateObject var signUpModel: SignupViewModel = .init()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack{
                Spacer()
                Text("")
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top,(UIApplication.shared.connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.top)! + 5)
            .padding(.bottom, 80)
            .background(Colors.backgroundShape)
            .clipShape(Corners(corner: [.bottomRight], size: CGSize(width: 55, height: 55)))
        
            HStack{
                VStack(alignment: .leading, spacing: 15) {
                    Text("Create Account")
                        .foregroundColor(Color(hue: 0.129, saturation: 0.459, brightness: 0.952))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.leading, -20)
                .padding(.top, 35)
                .padding(.bottom, 50)
                .frame(width: UIScreen.main.bounds.width - 80)
                .background(Color(hue: 0.614, saturation: 0.09, brightness: 0.974))
                .clipShape(Corners(corner: [.topLeft,.topRight,.bottomRight], size: CGSize(width: 55, height: 55)))
            }
            .padding(.top, -40)
            .padding(.leading, (UIApplication.shared.connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.left)! - 80)
            
            
            
            ZStack {
                Color(hue: 0.614, saturation: 0.09, brightness: 0.974)

                VStack {
                    VStack {
                        CustomTextField(hint: "Full Name", text: $signUpModel.fullName)
                        CustomTextField(hint: "Email", text: $signUpModel.email)
                        CustomTextField(hint: "Password", text: $signUpModel.password)
                        CustomTextField(hint: "Confirm Password", text: $signUpModel.verifyPassword)
                    }
                    .padding(.top, 80)

                    HStack {
                        Spacer ()
                        
                        Button(action: signUpModel.createUser) {
                            HStack(spacing: 10) {
                                Text("SIGN UP")
                                    .fontWeight(.semibold)
                                    .contentTransition(.identity)
                                
                                Image(systemName: "line.diagonal.arrow")
                                    .font(.title3)
                                    .rotationEffect(.init(degrees: 45))
                            }
                            .foregroundColor(.gray)
                            .padding(.all, 12)
                            .background {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Colors.backgroundShape.opacity(0.6))
                            }
                        }
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                    
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        NavigationLink(destination: Login()) {
                            Text("Sign in")
                            .foregroundColor(Color(hue: 0.129, saturation: 0.459, brightness: 0.952))
                            .fontWeight(.semibold)
                        }
                    }
                    .padding(.bottom, 65)
                }
                .padding(.horizontal, 40)
                .background(Colors.backgroundColor)
                .clipShape(Corners(corner: [.topLeft], size: CGSize(width: 70, height: 70)))

            }
        }
        .ignoresSafeArea()
        .background(Color(red: 0.9254901960784314, green: 0.9764705882352941, blue: 1.0))
        .overlay(content: {
            Loading(show: $signUpModel.isLoading)
        })
    }
}

//struct SignUp_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
