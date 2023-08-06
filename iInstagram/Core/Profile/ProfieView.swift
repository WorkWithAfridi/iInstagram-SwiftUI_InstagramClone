//
//  ProfieView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct ProfieView: View {
    let user: UserModel
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]    
    var body: some View {
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
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0...15, id: \.self){
                        index in
                            Image("profile-img")
                                .resizable()
                                .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfieView_Previews: PreviewProvider {
    static var previews: some View {
        ProfieView(
            user: UserModel.MOCK_USERS[0]
        )
    }
}
