//
//  PostModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 7/8/23.
//

import Foundation

struct PostModel: Identifiable, Hashable, Codable{
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: UserModel?
    
}

extension PostModel{
    static var MOCK_POSTS: [PostModel] = [
        .init(id: NSUUID().uuidString, ownerUid:  NSUUID().uuidString, caption: "This is post one", likes: 10, imageUrl: "profile-img", timestamp: Date.now, user: UserModel.MOCK_USERS[0] ),
        .init(id: NSUUID().uuidString, ownerUid:  NSUUID().uuidString, caption: "This is post two", likes: 11, imageUrl: "profile-img", timestamp: Date.now, user: UserModel.MOCK_USERS[1] ),
        .init(id: NSUUID().uuidString, ownerUid:  NSUUID().uuidString, caption: "This is post three", likes: 12, imageUrl: "profile-img", timestamp: Date.now, user: UserModel.MOCK_USERS[2] ),
        .init(id: NSUUID().uuidString, ownerUid:  NSUUID().uuidString, caption: "This is post four", likes: 13, imageUrl: "profile-img", timestamp: Date.now, user: UserModel.MOCK_USERS[3] ),
        .init(id: NSUUID().uuidString, ownerUid:  NSUUID().uuidString, caption: "This is post five", likes: 14, imageUrl: "profile-img", timestamp: Date.now, user: UserModel.MOCK_USERS[0] ),
    ]
}
