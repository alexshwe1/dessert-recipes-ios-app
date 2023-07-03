//
//  MealListView.swift
//  Fetch Recipe Application
//
//  Created by Alex Shwe on 7/2/23.
//

import SwiftUI

struct MealListView: View {
    @State private var meals: [Meal] = []
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchBar(searchText: $searchText, placeholder: "Search meals")
                .padding(.vertical, 10.0)

            List(filteredMeals, id: \.idMeal) { meal in
                NavigationLink(destination: MealDetailView(mealId: meal.idMeal)) {
                    VStack(alignment: .leading) {
                        Text(meal.strMeal)
                            .font(.headline)
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 120)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }
        .navigationTitle("Recipes")
        .onAppear {
            fetchMeals { meals in
                self.meals = meals ?? []
            }
        }
    }
    
    struct MealResponse: Codable {
        let meals: [Meal]
    }
    
    private func fetchMeals(completion: @escaping ([Meal]?) -> Void) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching meals: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
                completion(mealResponse.meals)
            } catch {
                print("Error decoding meal response: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    private var filteredMeals: [Meal] {
        if searchText.isEmpty {
            return meals
        } else {
            return meals.filter { $0.strMeal.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
