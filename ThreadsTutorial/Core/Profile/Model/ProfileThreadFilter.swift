//
//  ProfileThreadFilter.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 2.09.2023.
//

import Foundation
enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
