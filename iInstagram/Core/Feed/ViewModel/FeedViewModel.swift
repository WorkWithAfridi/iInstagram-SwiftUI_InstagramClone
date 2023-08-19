//
//  FeedViewModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 19/8/23.
//

import Foundation
import Firebase

class FeedViewModel : ObservableObject{
    @Published var posts = [PostModel]()
    
    init(){
        Task{try await fetchPosts()}
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPost()
    }
}
