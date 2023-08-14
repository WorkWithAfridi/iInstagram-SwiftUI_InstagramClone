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
                ProfileHeader(user: user)
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
