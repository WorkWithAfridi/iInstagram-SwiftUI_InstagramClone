//
//  EditProfileView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 14/8/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @StateObject var viewModel = EditProfileViewModel()
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            HStack{
                Button("Cancel"){
                    dismiss()
                }
                Spacer()
                Text("Edit profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Button{
                    print("Profile editing done")
                } label: {
                    Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            Divider()
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack{
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }else{
                        Image("profile-img")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.vertical, 8)
            Divider()
            VStack{
                EditProfileTextField(title: "Name", placeholder: "Khondakar Afridi", text: $viewModel.nameController )
                EditProfileTextField(title: "Bio", placeholder: "Software Engineer | App Developer", text: $viewModel.bioController )
            }
            .padding(.vertical, 5)
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
