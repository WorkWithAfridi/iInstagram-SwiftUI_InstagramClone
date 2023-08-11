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
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        print("Email: \(email)")
        print("Password: \(password)")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
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
    
    func loadUserData() async throws{
        
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(userID: String, userName: String, email: String) async {
        
        let user = UserModel(
        id: userID, username: userName, email: email
        )
        
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
