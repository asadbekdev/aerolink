//
//  NetworkService.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        // TODO: Implement network request
    }
}
