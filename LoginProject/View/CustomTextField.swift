//
//  CustomTextField.swift
//  LoginProject
//
//  Created by Adi Amoyal on 15/02/2023.
//

import SwiftUI

struct CustomTextField: View {
    var hint: String
    @Binding var text: String
    
    var contentType: UITextContentType = .emailAddress
    @FocusState var isEnabled: Bool
    
    var body: some View {
        VStack {
            if (text == "Password") {
                SecureField(hint, text: $text)
                    .focused($isEnabled)
            } else {
                TextField(hint, text: $text)
                    .keyboardType(.emailAddress)
                    .textContentType(contentType)
                    .disableAutocorrection(true)
                    .focused($isEnabled)
            }
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(.black.opacity(0.2))
                
                Rectangle()
                    .fill(Color(red: 0.9725490196078431, green: 0.796078431372549, blue: 0.6509803921568628))
                    .frame(width: isEnabled ? nil : 0, alignment: .leading)
                    .animation(.easeInOut(duration: 0.3), value: isEnabled)
            }
            .frame(height: 2)
        }
        .padding(.top, 20)
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
