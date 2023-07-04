//
//  MealListViewTests.swift
//  Fetch Recipe ApplicationTests
//
//  Created by Alex Shwe on 7/3/23.
//

import XCTest
@testable import Fetch_Recipe_Application

class MealListViewTests: XCTestCase {

    func testFetchMeals_Success() {
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        let listView = MealListView()
        listView.fetchMeals { meals in
            XCTAssertNotNil(meals)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testMealListView_WithMeals() {
        // Given
        let meals = [
            Meal(strMeal: "Pasta", strMealThumb: "", idMeal: "1"),
            Meal(strMeal: "Pizza", strMealThumb: "", idMeal: "2"),
            Meal(strMeal: "Rice", strMealThumb: "", idMeal: "3")
        ]
        
        // When
        let listView = MealListView(meals: meals, searchText: "")
        
        // Then
        XCTAssertNotNil(listView)
        XCTAssertEqual(listView.meals, meals)
        XCTAssertEqual(listView.meals.count, 3)
    }
    
    func testMealListView_WithoutMeals() {
        // Given
        let meals: [Meal] = []
        
        // When
        let listView = MealListView(meals: meals, searchText: "")
        
        // Then
        XCTAssertNotNil(listView)
        XCTAssertTrue(listView.meals.isEmpty)
    }
    
}
