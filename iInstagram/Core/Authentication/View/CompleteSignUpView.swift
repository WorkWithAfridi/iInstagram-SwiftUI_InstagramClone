//
//  CompleteSignUpView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack{
            Text("Welcome to Instagram,")
                .font(.title2)
                .fontWeight(.bold)
            Text(viewModel.username)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("Click below to complete registration and start using Instagram.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)    
                .padding(.horizontal, 34)
                .padding(.bottom, 1)
            Button{
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .fontWeight(.semibold)
            }.padding(.vertical)
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
