//
//  Btn.swift
//  LoginProject
//
//  Created by Adi Amoyal on 21/02/2023.
//

import Foundation

struct Btn {
    let id = UUID()
    let name: String
    let action: () -> Void
}
