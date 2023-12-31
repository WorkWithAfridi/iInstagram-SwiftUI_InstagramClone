//
//  AddEmailView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        VStack{
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 34)
                .padding(.bottom, 10)
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink{
                CreateUserNameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Confirm Email")
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
