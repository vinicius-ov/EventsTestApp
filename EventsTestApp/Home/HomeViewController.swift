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
        title = "Eventos disponíveis"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventHomeTableViewCell
        cell.event = homeViewModel?.events[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            homeViewModel?.selectedEvent = homeViewModel?.events[indexPath.row]
        performSegue(withIdentifier: "gotoEventDetails", sender: self)
    }
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailsViewController, let event = homeViewModel?.selectedEvent else {
            return
        }
        vc.event = event
    }
}
