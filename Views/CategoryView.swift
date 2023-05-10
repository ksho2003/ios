//
//  CategoryView.swift
//  Kailee Makes
//
//  Created by Kailee Higgins Ott on 5/8/23.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    var category: Category
    //Computed propert
    var recipes: [Recipe] {
        return recipesVM.recipes.filter{$0.category == category.rawValue}
    }
    
    var body: some View {
        ScrollView{
            RecipeList(recipes: recipes)
        }
        .navigationTitle(category.rawValue + "s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.main)
            .environmentObject(RecipeViewModel())
    }
}
