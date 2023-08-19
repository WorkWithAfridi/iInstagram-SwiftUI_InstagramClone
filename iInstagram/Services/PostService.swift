//
//  PostService.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 19/8/23.
//

import Foundation
import Firebase

struct PostService{
    static func fetchFeedPost() async throws -> [PostModel]{
        
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({ document in
            let post = try document.data(as: PostModel.self)
            return post
        })
        
        for i in 0..<posts.count{
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPost(user: UserModel) async throws -> [PostModel]{
        let snapshot = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: user.id).getDocuments()
        var posts = try snapshot.documents.compactMap({ document in
            let post = try document.data(as: PostModel.self)
            return post
        })
        
        for i in 0..<posts.count{
            posts[i].user = user
        }
        
        return posts
    }
}
