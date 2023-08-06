//
//  UserModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import Foundation

struct UserModel : Identifiable, Hashable, Codable{
    var id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension UserModel{
    static var MOCK_USERS: [UserModel] = [
        .init(
            id: NSUUID().uuidString,
            username: "Mr_m.user",
            profileImageUrl: "profile-img",
            fullname: "Mr Mock User",
            bio: "Hello world - this is a test user",
            email: "m.user@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Mr_m.user 1",
            profileImageUrl: "profile-img",
            fullname: "Mr Mock User 1",
            bio: "Hello world - this is a test user 1",
            email: "m.user1@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Mr_m.user 2",
            profileImageUrl: "profile-img",
            fullname: "Mr Mock User 2",
            bio: "Hello world - this is a test user 2",
            email: "m.user2@gmail.com"
        ),
        .init(
            id: NSUUID().uuidString,
            username: "Mr_m.user 3",
            profileImageUrl: "profile-img",
            fullname: nil,
            bio: "Hello world - this is a test user 3",
            email: "m.user3@gmail.com"
        ),
    ]
}
