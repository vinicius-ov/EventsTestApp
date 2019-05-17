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
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var cuponsCollectionView: UICollectionView!
    @IBOutlet weak var attendeesCollectionView: UICollectionView!
    
    var detailsViewModel: DetailsViewModel?
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attendeesCollectionView.dataSource = self
        cuponsCollectionView.dataSource = self
        
        detailsViewModel = DetailsViewModel.init(checkinService: CheckinService())
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadCollectionView), name: NSNotification.Name(rawValue: "updateAttendees"), object: nil)
        
        let placeholder = UIImage(named: "mentha-logo")
        eventImage.af_setImage(withURL: URL(string: event.imageUrl!)!, placeholderImage: placeholder)
        eventTitleLabel.text = event.title
        guard let dateTimestamp = event.date else {
            return
        }
        let date = Date(timeIntervalSince1970: dateTimestamp / 1000.0)
        dateLabel.text = date.formattedDate()
        hourLabel.text = date.formattedHour()
        descriptionText.text = event.description
        
    }
    
    override func viewWillLayoutSubviews() {
        descriptionText.setContentOffset(.zero, animated: false)
    }
    
    @IBAction func showShareSheet(_ sender: Any) {
        let activityViewController = UIActivityViewController(
            activityItems: ["Compartilhar atividade", "JSON evento"],
            applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func performCheckin(_ sender: Any) {
        let userCheckinRequest = CheckinRequest(name: "Manolo", email: "manolo@manolo.com", eventId: event.id!)
        let people = People(id: "20",eventId: "Manolo",name: "")
        event.people?.append(people)
        detailsViewModel?.sendCheckin(checkinRequest: userCheckinRequest)
    }
    
    @objc func reloadCollectionView(){
        attendeesCollectionView.reloadData()
    }
}

extension DetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == attendeesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attendeeCell", for: indexPath) as! AttendeesCollectionViewCell
            cell.attendee = event.people?[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cupomCell", for: indexPath) as! CuponsCollectionViewCell
            cell.cupom = event.cupons![indexPath.row]
            return cell
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == attendeesCollectionView {
            return event.people?.count ?? 0
        }
        return event.cupons?.count ?? 0
    }
    
}
