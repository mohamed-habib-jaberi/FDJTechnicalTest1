//
//  NetworkError.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

public enum NetworkError: Error {
    case errorStatusCode(statusCode: Int)
    case genericError(error: GenericNetworkError)
    case requestError(RequestErrorType)
    case apiKeyNotValid
    case notConnected
    case cancelled
}

public enum RequestErrorType {
    case parsingJSON
    case mappingDTO
    case urlGeneration
    case unknown
}

extension NetworkError {
    public var isNotFoundError: Bool { return hasStatusCode(404) }

    public func hasStatusCode(_ codeError: Int) -> Bool {
        switch self {
        case let .errorStatusCode(code):
            return code == codeError
        case let .genericError(genericError):
            return genericError.status == codeError
        default: return false
        }
    }
    
    public var getError: GenericNetworkError? {
        if case let .genericError(error) = self {
            return error
        } else {
            return nil
        }
    }
    
    public static func handleError(data: Data, response: HTTPURLResponse) -> NetworkError {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(GenericNetworkErrorResponseDTO.self, from: data)
            let genericError = result.toDomain(code: response.statusCode)
            if genericError.detail == Constants.Networking.apiKeyNotValid {
                return NetworkError.apiKeyNotValid
            } else {
                return NetworkError.genericError(error: genericError)
            }
        } catch let error {
            print("error : \(error)")
                return NetworkError.requestError(.unknown)
        }
    }
}
