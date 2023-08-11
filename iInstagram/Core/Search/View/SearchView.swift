//
//  SearchView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView{
                    LazyVStack(spacing: 12){
                        ForEach(viewModel.users){
                            user in
                            NavigationLink(value: user) {
                                HStack {
                                    Image(user.profileImageUrl ?? "profile-img")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(user.username)
                                            .fontWeight(.semibold)
                                        if user.fullname != nil{
                                            Text(user.fullname ?? "")
                                        }
                                    }.font(.footnote)
                                    Spacer()
                                }
                                .foregroundColor(.black)
                                .padding(.horizontal)

                            }
                        }
                    }
                    .padding(.top, 2)
                    .searchable(text: $searchText, prompt: "Search...")
                }
            }.navigationDestination(for: UserModel.self) { user in
                ProfieView(
                    user: user                )
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
