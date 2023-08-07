//
//  ProfilePostGridView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 7/8/23.
//

import SwiftUI

struct ProfilePostGridView: View {
    var posts: [PostModel]
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    private let imageDimension : CGFloat  = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(posts){
                post in
                Image(post.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageDimension, height: imageDimension)
            }
        }
    }
}

struct ProfilePostGridView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostGridView(
            posts: PostModel.MOCK_POSTS
        )
    }
}
