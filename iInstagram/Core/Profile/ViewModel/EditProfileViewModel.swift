//
//  EditProfileViewModel.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 14/8/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class EditProfileViewModel : ObservableObject {
    @Published var user: UserModel
    init(user: UserModel) {
        self.user = user
    }
    
    @Published var selectedImage: PhotosPickerItem?{
        didSet {Task {await loadImage(fromItem: selectedImage)}}
    }
    @Published var profileImage: Image?
    @Published var nameController = ""
    @Published var bioController = ""
    
    private var uiImage : UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else{return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:  data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData()async throws{
        
        var data = [String: Any]() // A Map
        
        if let uiImage = uiImage{
           let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !nameController.isEmpty && user.fullname != nameController {
            user.fullname = nameController
            data["fullname"] = nameController
        }
        if !bioController.isEmpty && user.bio != bioController {
            user.bio = bioController
            data["bio"] = bioController
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    
}
