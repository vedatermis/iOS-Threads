//
//  ProfileViewModel.swift
//  ThreadsTutorial
//
//  Created by Vedat ERMIS on 19.09.2023.
//

import Foundation
import Combine

class CurrentProfileViewModel : ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            
        }.store(in: &cancellables)
    }
}
