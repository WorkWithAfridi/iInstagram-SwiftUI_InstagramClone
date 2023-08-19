//
//  PostGridViewModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 19/8/23.
//

import Foundation

class PostGridViewModel: ObservableObject{
    @Published var posts = [PostModel]()
    private let user: UserModel
    init(user: UserModel){
        self.user = user
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPost(user: user)
    }
}
