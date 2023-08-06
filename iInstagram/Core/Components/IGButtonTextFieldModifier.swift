//
//  IGButtonTextFieldModifier.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct IGButtonTextFieldModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}
