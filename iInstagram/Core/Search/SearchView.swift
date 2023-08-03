//
//  SearchView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            VStack {
                ScrollView{
                    LazyVStack(spacing: 12){
                        ForEach(0...20, id: \.self){
                            user in
                            HStack {
                                Image("profile-img")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text("Mr_User")
                                        .fontWeight(.semibold)
                                    Text("Sherlock Homes")
                                }.font(.footnote)
                                Spacer()
                            }.padding(.horizontal)
                        }
                    }
                    .padding(.top, 2)
                    .searchable(text: $searchText, prompt: "Search...")
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
