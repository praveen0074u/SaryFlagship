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
        return ["Content-type": "application/json"]

    }
    var sampleData: Data {
        
        print("sampele fetch")
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
