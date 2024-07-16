//
//  ContentView.swift
//  CalorieCook
//
//  Created by Tolga Sarikaya on 16.07.24.
//

import SwiftUI

struct ContentView: View {
   @StateObject private var serviceModel = ProductService()
    
    var body: some View {
        VStack {
            if let product = serviceModel.foodProduct?.product {
                Text(product.productName ?? "No product Name")
                if let nutriments = product.nutriments {
                    Text("Carbohydrates: \(nutriments.carbohydrates ?? 0)g")
                    Text("Energy: \(nutriments.energyKcal ?? 0)kcal")
                    Text("Sugars: \(nutriments.sugars ?? 0)g")
                }
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            serviceModel.fetchFoodProduct()
        }
    }
}

#Preview {
    ContentView()
}
