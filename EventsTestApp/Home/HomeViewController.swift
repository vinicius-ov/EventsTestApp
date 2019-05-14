//
//  ViewController.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 14/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var homeViewModel: HomeViewModel?
    
    public static func initiate(viewModel: HomeViewModelDelegate? = nil) -> HomeViewController {
        let main = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = main.instantiateViewController(withIdentifier: "HomeMapViewController")
            as? HomeViewController else {
                fatalError()
        }
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeViewModel = HomeViewModel.init(eventsService: EventsService())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        homeViewModel?.eventsService.fetchEvents { events in
            
        }
    }


}
