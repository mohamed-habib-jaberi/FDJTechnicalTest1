//
//  NetworkService+helpers.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

extension HTTPURLResponse {
    var isTokenExpired: Bool {
        statusCode == 401
    }
}

extension NetworkServiceImpl {
    func handleNetworkError(_ error: Error) -> NetworkError {
        guard let error = error as? NetworkError else {
            switch error._code {
            case NSURLErrorNotConnectedToInternet:
                return .notConnected
            case NSURLErrorCancelled:
                return .cancelled
            default:
                return .requestError(.unknown)
            }
        }
        return error
    }
    
    func decode<T: Decodable>(data: Data, response: URLResponse) async throws -> T {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            if let emptyResponse = EmptyResponseDTO() as? T {
                return emptyResponse
            } else {
                throw NetworkError.requestError(.parsingJSON)
            }
        }
    }
}
