//
//  ESIMDetailView.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import SwiftUI

struct ESIMDetailView: View {
    let esim: ESIMItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(esim.country)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Group {
                InfoRow(title: "Provider", value: esim.provider)
                InfoRow(title: "Data", value: esim.dataAmount)
                InfoRow(title: "Validity", value: esim.validityPeriod)
                InfoRow(title: "Price", value: String(format: "$%.2f", esim.price))
            }
            
            Spacer()
            
            Button(action: {
                // Implement purchase action
            }) {
                Text("Purchase")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("eSIM Details")
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
    }
}
