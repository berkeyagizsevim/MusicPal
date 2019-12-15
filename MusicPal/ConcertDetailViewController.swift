//
//  ConcertDetailViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 15.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class ConcertDetailViewController: UIViewController {
    
    
    @IBOutlet weak var concertImage: UIImageView!
    @IBOutlet weak var concertDate: UILabel!
    @IBOutlet weak var attendeeNumber: UILabel!
    @IBOutlet weak var concertName: UILabel!
    @IBOutlet weak var concertDetail: UILabel!
    @IBOutlet weak var buyTicketButton: UIButton!
    
    @IBOutlet weak var detailsAboutConcert: UITextView!
    var ticketBought = false
    
    var dateOfConcert = ""
    var peopleCount = ""
    var nameOfConcert = ""
    var detailOfConcert = ""
    var detailedTextAboutConcert = ""
    var imageOfConcert = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concertDate.text = dateOfConcert
        attendeeNumber.text = peopleCount
        concertName.text = nameOfConcert
        concertDetail.text = detailOfConcert
        detailsAboutConcert.text = detailedTextAboutConcert
        concertImage.image = imageOfConcert
    }
    
    
    
    @IBAction func buyTicketTapped(_ sender: UIButton) {
        
        if ticketBought == false{
            let alert = UIAlertController(title: "You bought a ticket", message: "Yeeey", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okey", style: .default) { (alert) in
                self.buyTicketButton.setTitle("Drop the ticket", for: .normal)
                self.buyTicketButton.backgroundColor = UIColor.black
                self.ticketBought = true
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "You dropped the ticket!", message: "Yeeey", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okey", style: .default) { (alert) in
                self.buyTicketButton.setTitle("Buy Ticket", for: .normal)
                self.buyTicketButton.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.2352941176, blue: 0.9215686275, alpha: 1)
                self.ticketBought = false
        }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
    }
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
