//
//  HeaderNavigationBar.swift
//  LoginProject
//
//  Created by Adi Amoyal on 20/02/2023.
//

import SwiftUI

struct Header: View {
    @State var selection: String = ""
    var name: String
    var buttons: [Btn]
    var dropdownMenu: Bool
    var dropdownMenuOptions: [DropdownMenuOption]
    
    var body: some View {
        HStack {
            Text("\(name)")
            
            Spacer()
            
            if dropdownMenu {
                DropdownMenu(selectedOption: $selection, content: dropdownMenuOptions, activeTint: .primary.opacity(0.1), inActiveTint: .black.opacity(0.05))
                    .frame(width: 200)
            } else {
                ForEach(buttons, id: \.id) { btn in
                    Button(action: btn.action) {
                        Image(systemName: btn.name)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .font(.title2)
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
