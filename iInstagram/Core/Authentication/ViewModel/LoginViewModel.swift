//
//  LoginViewModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 10/8/23.
//

import Foundation
class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
      try await AuthService.shared.login(withEmail: email, password: password)
    }
}
