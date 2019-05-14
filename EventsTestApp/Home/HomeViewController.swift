//
//  ViewController.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var homeViewModel: HomeViewModelDelegate?
    
    public static func initiate(viewModel: HomeViewModelDelegate? = nil) -> HomeViewController {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = main.instantiateViewController(withIdentifier: "HomeMapViewController")
            as? HomeViewController else {
                fatalError()
        }
        viewController.homeViewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

