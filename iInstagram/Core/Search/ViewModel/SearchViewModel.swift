//
//  SearchViewModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 11/8/23.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var users = [UserModel]()
    
    init(){
        Task{ try await fetchAllUsers()  }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}

