//
//  DetailsViewController.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 15/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var attendantsCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showShareSheet(_ sender: Any) {
        let activityViewController = UIActivityViewController(
            activityItems: ["Compartilhar atividade", "JSON evento"],
            applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func performCheckin(_ sender: Any) {
    }
}
