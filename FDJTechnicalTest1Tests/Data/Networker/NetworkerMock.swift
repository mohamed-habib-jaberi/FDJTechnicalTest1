//
//  NetworkerMock.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation
@testable import FDJTechnicalTest1

struct NetworkerMock: Networker {
    let dataAndResponse: (Data, URLResponse)?
    let error: Error?
    
    func loadData(from request: URLRequest) async throws -> (Data, URLResponse) {
        guard let result = dataAndResponse else {
            if let networkError = error {
                throw networkError
            }
            throw NetworkErrorMock.unknown
        }
        return result
    }
}
