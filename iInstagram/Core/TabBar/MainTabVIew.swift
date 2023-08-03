//
//  MainTabVIew.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct MainTabVIew: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem{
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem{
                    Image(systemName: "plus.square")
                }
            Text("Notifications")
                .tabItem{
                    Image(systemName: "heart")
                }
            ProfieView()
                .tabItem{
                    Image(systemName: "person")
                }
        }.accentColor(.black)
    }
}

struct MainTabVIew_Previews: PreviewProvider {
    static var previews: some View {
        MainTabVIew()
    }
}
