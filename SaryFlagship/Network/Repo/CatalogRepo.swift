//
//  CatalogRepo.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import Foundation
import Moya
import RxSwift

protocol CatalogRepoProtocol {
    func banners() -> Single<BannerResponse>
    func catalogs() -> Single<CatalogResponse>
}

class CatalogRepo : CatalogRepoProtocol {
    func banners() -> Single<BannerResponse> {
        NetworkProvider.shared.request(MultiTarget(CatalogTarget.getBanner))
    }
    
    func catalogs() -> Single<CatalogResponse> {
        NetworkProvider.shared.requestStub(MultiTarget(CatalogTarget.getCatalog))
    }
}


