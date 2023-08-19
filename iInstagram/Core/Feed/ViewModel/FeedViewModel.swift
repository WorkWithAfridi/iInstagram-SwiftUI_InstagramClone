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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ document in
            let post = try document.data(as: PostModel.self)
            return post
        })
        
        for i in 0..<posts.count{
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
    }
}
