//
//  ContentView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            } else{
                MainTabVIew()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
