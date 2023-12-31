//
//  ProfileHeader.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 14/8/23.
//

import SwiftUI

struct ProfileHeader: View {
    let user: UserModel
    @State private var showEditProfile = false
    var body: some View {
        VStack(spacing: 10){
            HStack{
                CircularProfileImageView(user: user, size: .large)
                Spacer()
                HStack(spacing: 8){
                    UserStatView(
                        value: 0,
                        title: "Posts"
                    )
                    UserStatView(
                        value: 0,
                        title: "Followers"
                    )
                    UserStatView(
                        value: 0,
                        title: "Following"
                    )
                }
            }
            .padding(.horizontal)
            VStack(alignment: .leading, spacing: 4){
                if user.fullname != nil{
                    Text(user.fullname!)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if user.bio != nil{
                    Text(user.bio!)
                        .font(.footnote)
                }
            }.frame(
                maxWidth: .infinity,
                alignment: Alignment.leading
            ).padding(.horizontal)
            Button{
                if(user.isCurrentUser){
                    print("Edit profile")
                    showEditProfile.toggle()
                }else{
                    print("Follow user")
                }
            } label:{
                Text(user.isCurrentUser ? "Edit Profile": "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(
                                user.isCurrentUser ? Color.gray : .clear,
                                lineWidth: 1
                            )
                    )
                    .cornerRadius(4)
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(
                user: user
            )
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(
            user: UserModel.MOCK_USERS[0]
        )
    }
}
