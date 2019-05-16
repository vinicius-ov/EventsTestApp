//
//  DetailsViewController.swift
//  EventsTestApp
//
//  Created by Vinicius Valvassori on 15/05/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var attendantsCollectionView: UICollectionView!
    
    var detailsViewModel: DetailsViewModel?
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsViewModel = DetailsViewModel.init(checkinService: CheckinService())
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadCollectionView), name: NSNotification.Name(rawValue: "updateAttendees"), object: nil)
        
        let placeholder = UIImage(named: "mentha-logo")
        eventImage.af_setImage(withURL: URL(string: event.imageUrl!)!, placeholderImage: placeholder)
        
    }
    
    @IBAction func showShareSheet(_ sender: Any) {
        let activityViewController = UIActivityViewController(
            activityItems: ["Compartilhar atividade", "JSON evento"],
            applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func performCheckin(_ sender: Any) {
        detailsViewModel?.sendCheckin(checkinRequest: CheckinRequest())
    }
    
    @objc func reloadCollectionView(){
        print("update collection view \(detailsViewModel?.response) \(detailsViewModel?.error)")
    }
}
