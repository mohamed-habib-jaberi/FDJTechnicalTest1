//
//  BaseURL.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

public protocol BaseURL {
    var url: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}

public struct BaseURLImpl: BaseURL {
    public let url: URL
    public let headers: [String: String]
    public let queryParameters: [String: String]

    public init(url: URL,
                headers: [String: String],
                queryParameters: [String: String] = [:]) {
        self.url = url
        self.headers = headers
        self.queryParameters = queryParameters
    }
}
