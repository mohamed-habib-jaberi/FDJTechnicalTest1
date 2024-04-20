//
//  Endpoint.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

protocol Endpoint {
    var path: String { get }
}

class EndpointImpl: Endpoint {
    var path: String
    
      init(path: String) {
          self.path = path
      }
}
