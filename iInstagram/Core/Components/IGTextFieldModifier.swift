//
//  IGTextFieldModifier.swift
//  iInstagram
//
//  Created by Khondakar Afridi on 6/8/23.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .font(.subheadline)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
