//
//  NetworkService.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

protocol NetworkService: AnyObject {
    var networker: Networker { get }
    func request<T: Decodable>(baseURL: BaseURL?) async throws -> T
}

final class NetworkServiceImpl: NetworkService {
    
    // MARK: - Properties
    
    var networker: Networker
    
    // MARK: - Initialization
    
    init(networker: Networker = URLSession.shared) {
        self.networker = networker
        
    }
    
    func request<T: Decodable>(baseURL: BaseURL?) async throws -> T {
        
        do {
            
            
            let urlRequestt: NSMutableURLRequest? = NSMutableURLRequest(url: NSURL(string: "https://api.rawg.io/api/games?key=29ca278badb84604a82dcbacf09c0e40")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            
            guard let urlRequest = urlRequestt else {
                throw NetworkError.requestError(.urlGeneration)
            }
            
            let (data, response) = try await networker.loadData(from: urlRequest as URLRequest)
            guard let httpResponse = response as? HTTPURLResponse, (300..<600).contains(httpResponse.statusCode) else {
               
                return try await decode(data: data, response: response)
            }
            
            let error: NetworkError = NetworkError.handleError(data: data, response: httpResponse)
            throw error
         
        } catch let error {
            print("error : \(error)")
            throw handleNetworkError(error)
        }
    }
}
