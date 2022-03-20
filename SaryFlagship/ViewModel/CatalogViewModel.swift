//
//  CatalogViewModel.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import Foundation
import RxSwift

class CatalogViewModel{
    
    private let repo: CatalogRepo
    
    var publishCatalog: PublishSubject<CatalogResponse> = PublishSubject()
    
    init(repo: CatalogRepo) {
        self.repo = repo
    }
    
    func getCatalogs() {
        repo.catalogs().subscribe { [weak self] catalogs in
            self?.publishCatalog.onNext(catalogs)
        } onFailure: { error in
            self.publishCatalog.onError(error)
        } onDisposed: {
        }
    }
}
