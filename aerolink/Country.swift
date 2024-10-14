//
//  Country.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import Foundation

struct Country: Codable, Identifiable {
    let name: String
    let code: String
    let flagImgUrl: String
    
    var id: String { code }  // Use the country code as the identifier
}
