//
//  ContentView.swift
//  Kailee Makes
//
//  Created by Kailee Higgins Ott on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
}
