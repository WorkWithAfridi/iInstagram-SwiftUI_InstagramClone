//
//  ContentViewModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 8/8/23.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject{
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    init(){
        setupSubscribers()
    }
    
    func setupSubscribers(){
        service.$userSession.sink { [weak self] userSession  in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser  in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
}
