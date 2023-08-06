//
//  LoginView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("instagram")
                    .resizable()
                    .frame(width: 280, height: 80)
                    .padding(.bottom, 10)
                VStack{
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    SecureField("Enter your password", text: $password)
                        .padding(12)
                        .font(.subheadline)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    Button{
                        print("Show forgot password")
                    } label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    NavigationLink {
                        MainTabVIew()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Login")
                            .modifier(IGButtonTextFieldModifier())
                    }.padding(.vertical, 16)
                    HStack{
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                    }
                    .foregroundColor(.gray)
                    HStack{
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                        Text("Continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding(.top, 8)
                }
                Spacer()
                Divider()
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                            Text("Don't have an account?")
                            Text("Sign up")
                                .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }.padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
