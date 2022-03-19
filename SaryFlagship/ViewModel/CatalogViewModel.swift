//
//  CatalogViewModel.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import Foundation

class CatalogViewModel{
    
    private let repo: CatalogRepo
        
    var catalogData: CatalogResponse?
    
    init(repo: CatalogRepo) {
        self.repo = repo
        getCatalogs()
    }
    
    func getCatalogs() {
        
        CatalogRepo.init().catalogs().subscribe { catalogs in
            print("success")
            print(catalogs)
            self.catalogData = catalogs
        } onFailure: { error in
            print("error")
        } onDisposed: {
            print("on dispose")
        }


    }
    
}
