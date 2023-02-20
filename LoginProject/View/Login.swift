//
//  Login.swift
//  LoginProject
//
//  Created by Adi Amoyal on 15/02/2023.
//

import SwiftUI

struct Login: View {
    @StateObject var loginModel: LoginViewModel = .init()
    
    var body: some View {
        
        NavigationView {
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
                        (Text("Welcome Back")
                            .foregroundColor(Color(hue: 0.129, saturation: 0.459, brightness: 0.952))
                            .font(.largeTitle)
                            .fontWeight(.bold) +
                        Text("\nPlease sign in to continue.")
                            .foregroundColor(.gray)
                            .font(.body)
                            .fontWeight(.medium)
                        )
                        .lineSpacing(5)
                    }
                    .padding(.leading, -20)
                    .padding(.top, 40)
                    .padding(.bottom, 50)
                    .frame(width: UIScreen.main.bounds.width - 80)
                    .background(Color(hue: 0.614, saturation: 0.09, brightness: 0.974))
                    .clipShape(Corners(corner: [.topLeft,.topRight,.bottomRight], size: CGSize(width: 60, height: 60)))
                }
                .padding(.top, -55)
                .padding(.leading, (UIApplication.shared.connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }?.safeAreaInsets.left)! - 80)
                
                ZStack {
                    Color(hue: 0.614, saturation: 0.09, brightness: 0.974)

                    VStack {
                        VStack {
                            CustomTextField(hint: "Email", text: $loginModel.email)
                            CustomTextField(hint: "Password", text: $loginModel.password)
                        }
                        .padding(.top, 80)

                        HStack {
                            Spacer ()
                            
                            Button(action: loginModel.loginUser) {
                                HStack(spacing: 15) {
                                    Text("LOGIN")
                                        .fontWeight(.semibold)
                                        .contentTransition(.identity)
                                    
                                    Image(systemName: "line.diagonal.arrow")
                                        .font(.title3)
                                        .rotationEffect(.init(degrees: 45))
                                }
                                .foregroundColor(.gray)
                                .padding(.all, 12)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Colors.backgroundShape.opacity(0.6))
                                }
                            }
                        }
                        .padding(.top, 30)
                        
                        Spacer()
                        
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(.gray)
                            NavigationLink(destination: SignUp()) {
                                Text("Sign up")
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
            .padding(.vertical, 5)
            .alert(loginModel.errorMessage, isPresented: $loginModel.showError) {
                
            }
            .background(Colors.backgroundColor)
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(content: {
            Loading(show: $loginModel.isLoading)
        })
    }
}

//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environmentObject(AuthViewModel())
//    }
//}
