//
//  PreviewProvider.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 22.09.2023.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Vedat ERMİŞ", email: "vedat@hotmail.com", username: "vedatermis")
    let thread = Thread(ownerUid: "123", caption: "This is a mock thread", timestamp: Timestamp(), likes: 0)
}
