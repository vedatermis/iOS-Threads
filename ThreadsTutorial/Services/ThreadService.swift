//
//  ThreadService.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 1.10.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchTreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        
        return snapshot.documents.compactMap ({ try? $0.data(as: Thread.self) })
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        let thread = snapshot.documents.compactMap({ try? $0.data(as: Thread.self) })
        return thread.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
