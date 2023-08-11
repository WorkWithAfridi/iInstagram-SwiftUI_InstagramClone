//
//  CurrentUserProfileView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: UserModel
    
    var posts: [PostModel] {
        return PostModel.MOCK_POSTS.filter({
            $0.user?.username == user.username
        })
    }

    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 10){
                    HStack{
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
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
                        Text(user.username)
                    }.frame(
                        maxWidth: .infinity,
                        alignment: Alignment.leading
                    ).padding(.horizontal)
                    Button{
                        
                    } label:{
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(
                                        Color.gray,
                                        lineWidth: 1
                                    )
                            )
                    }
                    Divider()
                }
                ProfilePostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward").foregroundColor(.black)
                    }
                }
            }
        }
    }
}


struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(
            user: UserModel.MOCK_USERS[1])
    }
}
