//
//  FeedCell.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            HStack{
                Image("profile-img")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                Text("Mr_User")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.leading)
            Image("profile-img")
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
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 2)
            HStack{
                Text("Mr_User  ").fontWeight(.semibold) +
                Text("Donec consectetuer ligula vulputate sem tristique cursus. Nam nulla quam gravida non commodo a sodales sit amet nisi.")
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
        FeedCell()
    }
}
