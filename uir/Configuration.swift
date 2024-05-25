//
//  Configuration.swift
//  uir
//
//  Created by Александр  Сухинин on 21.05.2024.
//

import Foundation
struct Configuration{
    let defaultBaseURL: String
    let authURLString: String
    static var test: Configuration{
        return Configuration(defaultBaseURL:  "http://79.174.80.180:9000", authURLString: "/api/auth")
    }
}
