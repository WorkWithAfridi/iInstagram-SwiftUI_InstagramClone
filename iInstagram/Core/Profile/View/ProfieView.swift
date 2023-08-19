//
//  ProfieView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct ProfieView: View {
    let user: UserModel
    
    var body: some View {
        ScrollView{
                ProfileHeader(user: user)
                ProfilePostGridView(user: user)
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
