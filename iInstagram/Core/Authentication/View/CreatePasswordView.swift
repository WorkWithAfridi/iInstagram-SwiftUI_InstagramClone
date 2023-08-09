//
//  CreatePasswordView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack{
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 34)
                .padding(.bottom, 10)
            SecureField("Password", text: $viewModel.password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink{
                CompleteSignUpView()
            } label: {
                Text("Confirm Password")
                    .modifier(IGButtonTextFieldModifier())
            }.padding(.vertical)
            Spacer()
        }.toolbar{
            ToolbarItem(
                placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                    
                }
        }
    }
}

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
