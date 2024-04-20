//
//  NetworkErrorMock.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

enum NetworkErrorMock: Error {
    case errorStatusCode(statusCode: Int)
    case someError
    case unknown
}

