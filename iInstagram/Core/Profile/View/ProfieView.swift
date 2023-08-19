//
//  ProfieView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct ProfieView: View {
    let user: UserModel
    var posts: [PostModel] {
        return PostModel.MOCK_POSTS.filter({
            $0.user.username == user.username
        })
    }
    
    var body: some View {
        ScrollView{
                ProfileHeader(user: user)
                ProfilePostGridView(posts: posts)
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
