//
//  SignUpViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 11.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!{
        didSet{
            nameTextField.translatesAutoresizingMaskIntoConstraints = false
            nameTextField.layer.cornerRadius = 2
            nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @IBOutlet weak var mailTextField: UITextField!{
        didSet{
            mailTextField.translatesAutoresizingMaskIntoConstraints = false
            mailTextField.layer.cornerRadius = 2
            mailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.layer.cornerRadius = 2
            passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    @IBOutlet weak var passwordAgainTextField: UITextField!{
        didSet{
            passwordAgainTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordAgainTextField.layer.cornerRadius = 2
            passwordAgainTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    @IBOutlet weak var signUpButton: UIButton!{
        didSet{
            signUpButton.layer.cornerRadius = 6
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= (keyboardSize.height-150)
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "goBackLoginSegue", sender: nil)
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
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
