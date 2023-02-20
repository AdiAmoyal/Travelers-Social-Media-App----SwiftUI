//
//  Header.swift
//  LoginProject
//
//  Created by Adi Amoyal on 19/02/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Button(action: {  }) {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .frame(width: 17, height: 17)
            }
            .foregroundColor(.gray)
            .padding(.leading, 10)
            
            Spacer ()
            
            Button(action: {  }) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .foregroundColor(.gray)
            .padding(.trailing, 10)
        }
        .padding(.horizontal)
        .padding(.top,(UIApplication.shared.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.safeAreaInsets.top)! + 5)
        .padding(.bottom, 20)
        .background(Colors.backgroundShape)
        .clipShape(Corners(corner: [.bottomRight, .bottomLeft], size: CGSize(width: 40, height: 55)))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
