//
//  NetworkService.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

protocol NetworkService: AnyObject {
    var networker: Networker { get }
    func request<T: Decodable>(baseURL: String, endpoint: String) async throws -> T
}

final class NetworkServiceImpl: NetworkService {
    
    // MARK: - Properties
    
    var networker: Networker
    
    // MARK: - Initialization
    
    init(networker: Networker = URLSession.shared) {
        self.networker = networker
        
    }
    
    func request<T: Decodable>(baseURL: String, endpoint: String) async throws -> T {
        // Construct the URL by combining baseURL, API key, and endpoint
        let stringURL = baseURL + Constants.Networking.apiKey + endpoint

        // Create a URL request object
        guard let url = URL(string: stringURL) else {
            throw NetworkError.requestError(.urlGeneration)
        }
        let urlRequest = URLRequest(url: url)

        // Load data from the network
        let (data, response) = try await networker.loadData(from: urlRequest)

        let decodedData: T
        
        // Check if the response status code is in the success range
        if let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) {
            // Decode the data into the expected type
            decodedData = try await decode(data: data, response: response)
        } else {
            // Handle error based on the response status code
            let error = NetworkError.handleError(data: data, response: response as! HTTPURLResponse)
            throw error
        }
        
        return decodedData
    }
}
