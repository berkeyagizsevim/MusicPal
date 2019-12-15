//
//  CompleteProfileViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 15.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit
import Firebase


struct User{
    let name: String = "Berke Yağız Sevim"
    let location: String = "Istanbul - Turkey"
    let profileDescription: String?
    let experience = [String]()
}

var savedUser = [User]()


class CompleteProfileViewController: UIViewController {
    
//    var ref: DatabaseReference!
    
    @IBOutlet weak var profileDescription: UITextField!
    @IBOutlet weak var experience: UITextField!
    
    @IBOutlet weak var insturmentDetails: UITextField!
    
    @IBOutlet weak var whatYouWant: UITextField!
    
    @IBOutlet weak var whatYouListen: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "showProfileScreen", sender: nil)
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
