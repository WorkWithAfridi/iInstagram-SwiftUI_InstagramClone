//
//  UploadPostView.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 8/8/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @Binding var mainTabViewIndex: Int
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    
    func dismissPage(){
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        mainTabViewIndex = 0
    }
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    print("Cancel button pressed")
                    dismissPage()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button{
                    Task {
                        try await viewModel.uploadPost(caption:caption)
                        dismissPage()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            HStack{
                if let image = viewModel.postImage{
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(8)
                }
                TextField(
                    "Enter your caption",
                    text: $caption,
                    axis: .vertical
                ).frame(height: 150)
                    .padding(.leading, 5)
            }
            Spacer()
        }
        .padding(.horizontal)
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(
            isPresented: $imagePickerPresented,
            selection: $viewModel.selectedImage
        )
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(mainTabViewIndex: .constant(0))
    }
}
