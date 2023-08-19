//
//  FeedCell.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: PostModel
    var body: some View {
        VStack{
            if post.user != nil{
                HStack{
                    CircularProfileImageView(user: post.user!, size: .xSmall)
                    Text(post.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }.padding(.leading)
            }
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            HStack(spacing: 16){
                Button{
                    print("Like post")
                } label:{
                    Image(systemName: "heart")
                }
                Button{
                    print("Comment post")
                } label:{
                    Image(systemName: "bubble.right")
                }
                Button{
                    print("Share post")
                } label:{
                    Image(systemName: "paperplane")
                }
                Spacer()
            }.padding(.leading)
                .padding(.top, 4)
                .foregroundColor(.black)
                .imageScale(.large)
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 2)
            HStack{
                Text(post.user?.username ?? "").fontWeight(.semibold) +
                Text(" \(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading)
            .padding(.top, 1)
            Text("8h ago")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
                .foregroundColor(Color.gray)
            // caption label
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(
            post: PostModel.MOCK_POSTS[0]
        )
    }
}
