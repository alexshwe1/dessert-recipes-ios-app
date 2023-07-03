//
//  SearchBar.swift
//  Fetch Recipe Application
//
//  Created by Alex Shwe on 7/3/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $searchText)
                .foregroundColor(.primary)

            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}
