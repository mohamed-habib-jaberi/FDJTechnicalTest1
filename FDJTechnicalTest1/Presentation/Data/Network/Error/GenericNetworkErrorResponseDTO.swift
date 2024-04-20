//
//  GenericNetworkErrorResponseDTO.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct GenericNetworkErrorResponseDTO: Decodable {
    let type: String?
    let title: String?
    let status: Int?
    let detail: String?
    var key: String = ""
    
    enum CodingKeys: String, CodingKey {
        case type, title, status, detail, key
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try values.decodeIfPresent(String.self, forKey: .type)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.detail = try values.decodeIfPresent(String.self, forKey: .detail)
        self.status = try values.decodeIfPresent(Int.self, forKey: .status)
        if let key = try values.decodeIfPresent(String.self, forKey: .key) {
            self.key = key
        }
    }
}

extension GenericNetworkErrorResponseDTO {
    func toDomain(code: Int) -> GenericNetworkError {
        let status = status.isNil ? code : status
        return .init(type: type, title: title, status: status, detail: detail, key: GenericNetworkErrorKeys(rawValue: key.uppercased()) ?? .other)
    }
}
