//
//  ESIMListView.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import SwiftUI

struct ESIMListView: View {
    @StateObject private var viewModel = ESIMViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.esims) { esim in
                NavigationLink(destination: ESIMDetailView(esim: esim)) {
                    ESIMRowView(esim: esim)
                }
            }
            .navigationTitle("Available eSIMs")
            .onAppear {
                viewModel.fetchESIMs()
            }
        }
    }
}

struct ESIMRowView: View {
    let esim: ESIMItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(esim.country)
                .font(.headline)
            HStack {
                Text(esim.provider)
                Spacer()
                Text(esim.dataAmount)
            }
            .font(.subheadline)
            Text("$\(esim.price, specifier: "%.2f") - \(esim.validityPeriod)")
                .font(.caption)
        }
        .padding(.vertical, 4)
    }
}
