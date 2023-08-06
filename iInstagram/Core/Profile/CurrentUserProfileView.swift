//
//  CurrentUserProfileView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct CurrentUserProfileView: View {

    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]


    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 10){
                    HStack{
                        Image("profile-img")
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
                        Text("Khondakar Afridi")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Hello world")
                            .font(.footnote)
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
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{

                    } label: {
                        Image(systemName: "line.3.horizontal").foregroundColor(.black)
                    }
                }
            }
        }
    }
}


struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
