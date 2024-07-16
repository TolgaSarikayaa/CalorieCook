//
//  ProductService.swift
//  CalorieCook
//
//  Created by Tolga Sarikaya on 16.07.24.
//

import Foundation

class ProductService {
    
    @Published var foodProduct: FoodProduct?
    
    func fetchFoodProduct() {
        let urlString = "https://world.openfoodfacts.net/api/v2/product/3017624010701?fields=product_name,nutriscore_data,nutriments,nutrition_grades"
        guard let url = URL(string: urlString) else {
            print("Unvalid URL")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let foodProduct = try decoder.decode(FoodProduct.self, from: data)
                    DispatchQueue.main.async {
                        self.foodProduct = foodProduct
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
}
