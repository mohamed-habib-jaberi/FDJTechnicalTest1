//
//  EndpointMock.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation
@testable import WeBank

struct EndpointMock: Endpoint {
    var path: String
    
    
    init(path: String) {
        self.path = path
        
    }

}

