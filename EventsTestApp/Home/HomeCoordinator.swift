//
//  HomeCoordinator.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class HomeCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController = UIViewController()

}

// MARK: - RootViewCoordinator
extension HomeCoordinator: RootViewCoordinator {
    
    func start() {
        let homeViewModel = HomeViewModel()
        
    }
    
}
