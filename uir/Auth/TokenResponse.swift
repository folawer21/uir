//
//  TokenResponse.swift
//  uir
//
//  Created by Александр  Сухинин on 21.05.2024.
//

import Foundation
struct TokenResponse: Decodable{
    let authToken: String
    enum CodingKeys: String, CodingKey{
        case authToken = "auth_Token"
    }
}
