//
//  MealDetailView.swift
//  Fetch Recipe Application
//
//  Created by Alex Shwe on 7/2/23.
//

import SwiftUI

struct MealDetailView: View {
    let mealId: String
    
    @State private var mealDetail: MealDetail?
    
    var body: some View {
        VStack {
            if let mealDetail = mealDetail {
                Text(mealDetail.strMeal)
                    .font(.title)
                    .padding()
                
                Text("Instructions:")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text(mealDetail.strInstructions)
                    .padding()
                
                Text("Ingredients/Measurements:")
                    .font(.headline)
                    .padding(.top, 20)
                
                List {
                    ForEach(getIngredients(meal: mealDetail), id: \.self) { ingredient in
                        Text(ingredient)
                    }
                }
                .padding()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            fetchMealDetail()
        }
    }
    
    struct MealDetailResponse: Decodable {
        let meals: [MealDetail]
    }
    
    private func fetchMealDetail() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching meal detail: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let mealDetailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
                mealDetail = mealDetailResponse.meals.first
            } catch {
                print("Error decoding meal detail response: \(error.localizedDescription)")
            }
        }
        .resume()
    }
    
    private func getIngredients(meal: MealDetail) -> [String] {
        var ingredients: [String] = []
        let mirror = Mirror(reflecting: meal)

        for child in mirror.children {
            if let ingredient = child.value as? String,
               let ingredientKey = child.label,
               ingredientKey.starts(with: "strIngredient"), !ingredient.isEmpty {
                let index = ingredientKey.replacingOccurrences(of: "strIngredient", with: "")
                let measureKey = "strMeasure\(index)"
                
                if let measure = mirror.children.first(where: { $0.label == measureKey })?.value as? String,
                   !measure.isEmpty {
                    let ingredientWithMeasure = "\(measure) \(ingredient)"
                    ingredients.append(ingredientWithMeasure)
                }
            }
        }
        
        return ingredients
    }
}

