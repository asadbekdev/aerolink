//
//  ESIMViewModel.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import Foundation

class ESIMViewModel: ObservableObject {
    @Published var esims: [ESIMItem] = []
    @Published var purchasedESIMs: [ESIMItem] = []
        
    func fetchESIMs() {
        // TODO: Implement API call to fetch eSIMs
    }
        
    func fetchPurchasedESIMs() {
        // TODO: Implement API call to fetch purchased eSIMs
    }
}
