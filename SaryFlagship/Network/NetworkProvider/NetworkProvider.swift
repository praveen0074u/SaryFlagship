//
//  CatalogNetworkManager.swift
//  SaryFlagship
//
//  Created by Guest Login on 18/03/2022.
//

import Foundation
import RxSwift
import Moya

final class NetworkProvider {
    private init() {}
    
    static let shared = NetworkProvider()
    
    private let provider = MoyaProvider<MultiTarget>()
    private let stubProvider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub)
    
    func request<T: Decodable>(_ target: MultiTarget) -> Single<T> {
        Single<T>.create { observer in
            self.makeRequest(target)
                .subscribe(onSuccess: { response in
                    observer(.success(response))
                }, onFailure: { error in
                    //Error handling, etc. that you want to do in common throughout the project
                    observer(.failure(error))
                })
        }
    }
    
    func makeRequest<T: Decodable>(_ target: MultiTarget) -> Single<T> {
        provider.rx
            .request(MultiTarget(target))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(T.self, failsOnEmptyData: false)
    }
    
    func requestStub<T: Decodable>(_ target: MultiTarget) -> Single<T> {
        Single<T>.create { observer in
            self.makeRequestStub(target)
                .subscribe(onSuccess: { response in
                    observer(.success(response))
                }, onFailure: { error in
                    if let error = error as? MoyaError {
                        //Error handling, etc. that you want to do in common throughout the project
                        observer(.failure(error))
                    }
                })
        }
    }
    
    func makeRequestStub<T: Decodable>(_ target: MultiTarget) -> Single<T> {
        stubProvider.rx
            .request(MultiTarget(target))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(T.self, failsOnEmptyData: false)
    }
}

