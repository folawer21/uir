//
//  Configuration.swift
//  uir
//
//  Created by Александр  Сухинин on 21.05.2024.
//

import Foundation
struct Configuration{
    let defaultBaseURL: URL
    let authURLString: String
    static var test: Configuration{
        return Configuration(defaultBaseURL: URL(string: "api/sasha/test")!, authURLString: "api/sashs/auth")
    }
}
