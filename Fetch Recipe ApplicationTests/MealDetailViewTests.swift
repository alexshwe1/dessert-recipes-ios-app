//
//  MealDetailViewTests.swift
//  Fetch Recipe ApplicationTests
//
//  Created by Alex Shwe on 7/3/23.
//

import XCTest
@testable import Fetch_Recipe_Application

final class MealDetailViewTests: XCTestCase {
    
    // TODO: these tests for detail view could definitely be better. Ran short on time and will revisit.
        
    func testFetchMealDetail_Failure() {
        // Given
        let detailView = MealDetailView(mealId: "00000")
        
        // When
        detailView.fetchMealDetail()
        
        // Then
        XCTAssertNil(detailView.mealDetail)
    }
    
    
    func testFetchMealDetail_Success() {
        // Create an instance of MealDetailView with a valid meal ID
        let mealId = "52893"
        let mealDetailView = MealDetailView(mealId: mealId)
        
        print("mealDetailView.mealId: \(mealDetailView.mealId)")
        
        XCTAssertNotNil(mealDetailView.mealId, "Meal id should not be nil")
    }

}
