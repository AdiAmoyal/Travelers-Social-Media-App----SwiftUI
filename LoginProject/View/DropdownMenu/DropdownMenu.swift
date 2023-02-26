//
//  DropdownMenu.swift
//  LoginProject
//
//  Created by Adi Amoyal on 21/02/2023.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var expandView: Bool = false
    @Binding var selectedOption: String
    let content: [DropdownMenuOption]
    var activeTint: Color
    var inActiveTint: Color
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(alignment: .leading ,spacing: 0) {
                ForEach(content, id: \.self) { option in
                    RowView(option, size)
                }
            }
            .background {
                Rectangle()
                    .fill(inActiveTint)
            }
        }
        .frame(height: 55)
    
    }
    
    @ViewBuilder
    func RowView(_ option: DropdownMenuOption, _ size: CGSize) -> some View {
        HStack {
            Image(systemName: "\(option.image)")
            Text("\(option.option)")
        }
        .font(.title3)
        .fontWeight(.semibold)
        .padding(.horizontal)
        .frame(width: size.width * 0.7, height: size.height, alignment: .leading)
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
