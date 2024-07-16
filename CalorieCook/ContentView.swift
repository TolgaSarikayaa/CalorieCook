//
//  ContentView.swift
//  CalorieCook
//
//  Created by Tolga Sarikaya on 16.07.24.
//

import SwiftUI

struct ContentView: View {
   @StateObject private var serviceModel = ProductService()
    @State  private var searchText = ""
    
    var body: some View {
        VStack {
                   TextField("Enter product name", text: $searchText)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()

                   Button("Search") {
                       serviceModel.searchFoodProduct(for: searchText)
                   }
                   .padding()

                   if serviceModel.isLoading {
                       ProgressView("Loading...")
                   } else if let errorMessage = serviceModel.errorMessage {
                       Text(errorMessage)
                           .foregroundColor(.red)
                   } else if let product = serviceModel.foodProduct {
                       Text(product.productName ?? "No product name")
                       if let nutriments = product.nutriments {
                           if let carbohydrates = nutriments.carbohydrates {
                               Text("Carbohydrates: \(carbohydrates)g")
                           } else {
                               Text("Carbohydrates: N/A")
                           }
                           if let energyKcal = nutriments.energyKcal {
                               Text("Energy: \(energyKcal)kcal")
                           } else {
                               Text("Energy: N/A")
                           }
                           if let sugars = nutriments.sugars {
                               Text("Sugars: \(sugars)g")
                           } else {
                               Text("Sugars: N/A")
                           }
                       }
                   } else {
                       Text("No product found")
                   }
               }
               .padding()
           }
       }

       #Preview {
           ContentView()
       }
