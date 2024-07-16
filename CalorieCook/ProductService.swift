//
//  ProductService.swift
//  CalorieCook
//
//  Created by Tolga Sarikaya on 16.07.24.
//

import Foundation

class ProductService : ObservableObject {
    
    @Published var foodProduct: Product?
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    func fetchFoodProduct() {
        let urlString = "https://world.openfoodfacts.net/api/v2/product/fields=product_name,nutriscore_data,nutriments,nutrition_grades"
        guard let url = URL(string: urlString) else {
            print("Unvalid URL")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let foodProduct = try decoder.decode(Product.self, from: data)
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
    
    func searchFoodProduct(for productName: String) {
           let urlString = "https://world.openfoodfacts.net/api/v2/search?search_terms=\(productName)&fields=code,product_name,nutrition_grades,nutriments&json=1"
           guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
               print("Invalid URL")
               errorMessage = "Invalid URL"
               return
           }

           isLoading = true
           errorMessage = nil

           URLSession.shared.dataTask(with: url) { data, response, error in
               DispatchQueue.main.async {
                   self.isLoading = false

                   if let error = error {
                       self.errorMessage = "Error fetching data: \(error.localizedDescription)"
                       print("Error fetching data: \(error.localizedDescription)")
                       return
                   }

                   guard let data = data else {
                       self.errorMessage = "No data received"
                       print("No data received")
                       return
                   }

                   print(String(data: data, encoding: .utf8) ?? "No data to print") // Veriyi yazdırma

                   let decoder = JSONDecoder()

                   do {
                       let searchResult = try decoder.decode(SearchResult.self, from: data)
                       self.foodProduct = searchResult.products.first
                       print("Product fetched: \(self.foodProduct?.productName ?? "No product name")")
                   } catch {
                       self.errorMessage = "Error decoding JSON: \(error.localizedDescription)"
                       print("Error decoding JSON: \(error.localizedDescription)")
                   }
               }
           }.resume()
       }
   }

  
