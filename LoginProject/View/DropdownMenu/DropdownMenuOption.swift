//
//  DropdownMenuOption.swift
//  LoginProject
//
//  Created by Adi Amoyal on 21/02/2023.
//

import Foundation

struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID()
    let option: String
    let image: String
}

