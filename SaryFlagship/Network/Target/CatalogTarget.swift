//
//  CatalogTarget.swift
//  SaryFlagship
//
//  Created by Guest Login on 18/03/2022.
//

import Foundation
import Moya

enum CatalogTarget {
    case getBanner
    case getCatalog
}
extension CatalogTarget: TargetType {
    var baseURL: URL {
        
        return URL(string: ApiEnvironment.environment.domain())!
    }
    
    var path: String {
        switch self {
        case .getBanner:
            return ""
        case .getCatalog:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain

    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]

    }
    
    
}
