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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeViewModel = HomeViewModel.init(eventsService: EventsService())
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTable), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
    }
    
    @objc func reloadTable(){
        self.tableView.reloadData()
    }

}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel?.events.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell")
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //goto next view
    }
}
