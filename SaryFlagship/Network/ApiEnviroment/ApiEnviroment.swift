//
//  ApiEnviroment.swift
//  SaryFlagship
//
//  Created by Guest Login on 18/03/2022.
//

import Foundation

struct ApiEnvironment {
    
    static let environment: EnvironmentType = .dev
    
    enum EnvironmentType {
        case dev
        case qa
        case production
        
        func domain() -> String {
            switch self {
            case .dev:
                return "https://staging.sary.to/api"
            case .qa:
                return ""
            case .production:
                return ""
            }
        }
        
    }
    
    struct Domains {
        
        static func getDomainURL() -> String {
            return environment.domain()
        }
        
        static var isVerbose: Bool {
            return environment == .dev
        }
    }
    
    struct ProductRoutes {
        static let banner = "/v2.5.1/baskets/313817/banners/"
        static let catalog = "/baskets/313817/catalog/"
    }
}
