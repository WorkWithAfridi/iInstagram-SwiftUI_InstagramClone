//
//  AuthService.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 8/8/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    static let shared = AuthService()
    
    init(){
        Task{ try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        print("Email: \(email)")
        print("Password: \(password)")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch{
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, username: String) async throws{
        print("Email: \(email)")
        print("Password: \(password)")
        print("Username: \(username)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: User created.")
            await self.uploadUserData(userID: result.user.uid, userName: username, email: email)
            print("DEBUG: User data uploaded.")
        } catch{
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print("DEBUG: Snapshot data is \(snapshot.data())")
        self.currentUser = try? snapshot.data(as: UserModel.self)
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(userID: String, userName: String, email: String) async {
        let user = UserModel(
        id: userID, username: userName, email: email
        )
        self.currentUser = user
        
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
