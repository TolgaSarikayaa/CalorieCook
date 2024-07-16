//
//  Model.swift
//  CalorieCook
//
//  Created by Tolga Sarikaya on 16.07.24.
//

import Foundation

struct SearchResult: Codable {
    let products: [Product]
}

struct Nutriments: Codable {
    let carbohydrates: Double?
    let carbohydrates100g: Double?
    let carbohydratesUnit: String?
    let carbohydratesValue: Double?
    let energy: Int?
    let energyKcal: Int?
    let energyKcal100g: Int?
    let energyKcalUnit: String?
    let sugars: Double?
    let sugars100g: Double?
    let sugarsUnit: String?
    let sugarsValue: Double?
    
    enum CodingKeys: String, CodingKey {
        case carbohydrates
        case carbohydrates100g = "carbohydrates_100g"
        case carbohydratesUnit = "carbohydrates_unit"
        case carbohydratesValue = "carbohydrates_value"
        case energy
        case energyKcal = "energy-kcal"
        case energyKcal100g = "energy-kcal_100g"
        case energyKcalUnit = "energy-kcal_unit"
        case sugars
        case sugars100g = "sugars_100g"
        case sugarsUnit = "sugars_unit"
        case sugarsValue = "sugars_value"
    }
}

struct Product: Codable {
    let code: String?
    let productName: String?
    let nutritionGrades: String?
    let nutriments: Nutriments?
    
    enum CodingKeys: String, CodingKey {
        case code
        case productName = "product_name"
        case nutritionGrades = "nutrition_grades"
        case nutriments
    }
}
