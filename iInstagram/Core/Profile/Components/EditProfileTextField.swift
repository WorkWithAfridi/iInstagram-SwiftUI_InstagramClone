//
//  EditProfileTextField.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 14/8/23.
//

import SwiftUI

struct EditProfileTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var body: some View {
        HStack{
            Text(title)
                .padding(.horizontal)
                .frame(width: 100, alignment: .leading)
            VStack{
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
