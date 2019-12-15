//
//  ContactPopUpViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 15.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class ContactPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessageButtonClicked(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
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
