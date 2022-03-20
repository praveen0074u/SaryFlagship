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
            return ApiEnvironment.PathRoutes.banner
        case .getCatalog:
            return ApiEnvironment.PathRoutes.catalog
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain

    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Device-Type" : "ios",
                "App-Version" : "5.5.0.0.0",
                "Accept-Language" : "ar",
                "Platform" : "FLAGSHIP",
                "Authorization" : "Authorization"]
    }
    var sampleData: Data {
        
        switch self {
        case .getBanner:
            if let path = Bundle.main.path(forResource: "banner", ofType: "json") {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe){
                    return data
                }
            }
            
        case .getCatalog:
            if let path = Bundle.main.path(forResource: "catalog", ofType: "json") {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe){
                    return data
                }
            }
        }
        return Data()
    }
    
}
