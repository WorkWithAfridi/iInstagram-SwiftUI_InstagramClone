//
//  AddEmailView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .padding(.bottom, 1)
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 34)
                .padding(.bottom, 10)
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
            Button{
                
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            } .frame(width: 360, height: 44)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.vertical)
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
