//
//  CreateUserNameView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct CreateUserNameView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("Pick a username for your new account. You can always change it later.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 34)
                .padding(.bottom, 10)
            TextField("Username", text: $email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            NavigationLink{
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Create password")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(8)
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

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserNameView()
    }
}
