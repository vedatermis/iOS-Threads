//
//  Thread.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 1.10.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var user: User?
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
}
