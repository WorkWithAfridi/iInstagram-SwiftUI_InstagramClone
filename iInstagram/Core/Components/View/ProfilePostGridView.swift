//
//  ProfilePostGridView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 7/8/23.
//

import SwiftUI
import Kingfisher

struct ProfilePostGridView: View {
    let user: UserModel
    @StateObject var viewModel: PostGridViewModel
    
    init(user: UserModel) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    private let imageDimension : CGFloat  = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts){
                post in
                KFImage(URL(string: post.imageUrl))
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
            user: UserModel.MOCK_USERS[0]
        )
    }
}
