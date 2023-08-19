//
//  UserService.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 11/8/23.
//

import Foundation
import Firebase

struct UserService{
    static func fetchAllUsers() async throws -> [UserModel] {
//        var users = [UserModel]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        return snapshot.documents.compactMap({try? $0.data(as: UserModel.self)})
        
//        for doc in documents{
//            guard let tempUser = try? doc.data(as: UserModel.self) else { return users }
//            users.append(tempUser)
//        } // NOT CLEAN
        
//        return users
    }
    
    static func fetchUser(withUid: String ) async throws -> UserModel{
        let snapshot = try await Firestore.firestore().collection("users").document(withUid).getDocument()
        return try snapshot.data(as: UserModel.self)
    }
}
