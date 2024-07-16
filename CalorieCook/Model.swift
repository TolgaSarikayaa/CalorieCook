//
//  Model.swift
//  CalorieCook
//
//  Created by Tolga Sarikaya on 16.07.24.
//

import Foundation

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

struct NutriScoreData: Codable {
    let energy: Int?
    let energyPoints: Int?
    let energyValue: Int?
    let sugarsPoints: Int?
    let sugarsValue: Double?
    
    enum CodingKeys: String, CodingKey {
            case energy
            case energyPoints = "energy_points"
            case energyValue = "energy_value"
            case sugarsPoints = "sugars_points"
            case sugarsValue = "sugars_value"
        }
}

struct Product: Codable {
    let nutriments: Nutriments?
    let nutriscoreData: NutriScoreData?
    let nutritionGrades: String?
    let productName: String?

    enum CodingKeys: String, CodingKey {
        case nutriments
        case nutriscoreData = "nutriscore_data"
        case nutritionGrades = "nutrition_grades"
        case productName = "product_name"
    }
}

struct FoodProduct: Codable {
    let code: String?
    let product: Product?
    let status: Int?
    let statusVerbose: String?

    enum CodingKeys: String, CodingKey {
        case code
        case product
        case status
        case statusVerbose = "status_verbose"
    }
}

