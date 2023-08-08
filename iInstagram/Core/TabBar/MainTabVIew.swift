//
//  MainTabVIew.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct MainTabVIew: View {
    @State private var mainTabViewIndex = 0
    var body: some View {
        TabView(selection: $mainTabViewIndex){
            FeedView()
                .onAppear{
                    mainTabViewIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                }
                .tag(0)
            SearchView()
                .onAppear{
                    mainTabViewIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            UploadPostView(mainTabViewIndex: $mainTabViewIndex)
                .onAppear{
                    mainTabViewIndex = 2
                }
                .tabItem{
                    Image(systemName: "plus.square")
                }
                .tag(2)
            Text("Notifications")
                .onAppear{
                    mainTabViewIndex = 3
                }
                .tabItem{
                    Image(systemName: "heart")
                }
                .tag(3)
            CurrentUserProfileView(
                user: UserModel.MOCK_USERS[1])
                .onAppear{
                    mainTabViewIndex = 4
                }
                .tabItem{
                    Image(systemName: "person")
                }
                .tag(4)
        }.accentColor(.black)
    }
}

struct MainTabVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainTabVIew()
    }
}
