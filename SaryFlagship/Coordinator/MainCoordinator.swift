//
//  MainCoordinator.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CatalogViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
        print("------------------")
    }
}
