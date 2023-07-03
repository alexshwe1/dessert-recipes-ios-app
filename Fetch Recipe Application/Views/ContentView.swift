//
//  ContentView.swift
//  Fetch Recipe Application
//
//  Created by Alex Shwe on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MealListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
