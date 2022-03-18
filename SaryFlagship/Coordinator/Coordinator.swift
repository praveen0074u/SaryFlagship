//
//  Coordinator.swift
//  SaryFlagship
//
//  Created by Guest Login on 19/03/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
