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
    @Published var selectedImage: PhotosPickerItem?{
        didSet {Task {await loadImage(fromItem: selectedImage)}}
    }
    @Published var profileImage: Image?
    @Published var nameController = ""
    @Published var bioController = ""
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else{return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data:  data) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
    
}
