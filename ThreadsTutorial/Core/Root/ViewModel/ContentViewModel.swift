//
//  ContentViewModel.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 16.09.2023.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}

