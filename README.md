# Dessert Recipes iOS App

## Overview

This is a simple native iOS app that allows users to browse dessert recipes using [TheMealDB's API](https://www.themealdb.com/api.php).

The application leverages two API endpoints:
1.  https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the Dessert category.
2.  https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.

## Functionality

Users are shown a list of meals in the Dessert category, sorted alphabetically.

Users can use the search bar in the list view to filter for desserts by name.

When a user selects a meal, they are taken to a detail view that includes:
 - Meal name
 - Instructions
 - Ingredients/measurements

## List View
![Screen Shot 2023-07-03 at 5 50 57 PM](https://github.com/alexshwe1/Dessert-Recipes-iOS-App/assets/71849221/51bdae32-db57-4181-b353-722e657b5f4f)
![Screen Shot 2023-07-03 at 5 51 12 PM](https://github.com/alexshwe1/Dessert-Recipes-iOS-App/assets/71849221/ba865095-614c-40d8-a07a-3715d5ddd73a)



## Detail View
![Screen Shot 2023-07-03 at 5 52 15 PM](https://github.com/alexshwe1/Dessert-Recipes-iOS-App/assets/71849221/4796bba7-b083-4864-83e9-5d4cb5ebe178)

## Testing
Unit tests are located in ```/Fetch Recipe ApplicationTests```.

## TODO's
Build out unit tests to better test functionality and edge cases.
