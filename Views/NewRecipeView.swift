//
//  NewRecipeView.swift
//  Kailee Makes
//
//  Created by Kailee Higgins Ott on 5/8/23.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add recipe manually") {
                showAddRecipe = true
            }
                .navigationTitle("New Recipe")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showAddRecipe) {
            AddRecipeView()
        }
    }
}

struct NewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
