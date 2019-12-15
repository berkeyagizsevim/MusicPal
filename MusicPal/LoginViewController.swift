//
//  ViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 11.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!{
        didSet{
          emailTextField.translatesAutoresizingMaskIntoConstraints = false
          emailTextField.layer.cornerRadius = 2
          emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet{
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.layer.cornerRadius = 2
            passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!{
        didSet{
            loginButton.layer.cornerRadius = 7

        }
    }
    @IBOutlet weak var signUpButton: UIButton!{
        didSet{
            signUpButton.layer.cornerRadius = 7
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround() 
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setupUI()
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
    
    func setupUI(){
        
        //MARK: Change background color
        view.backgroundColor = UIColor(displayP3Red: 243, green: 245, blue: 249, alpha: 1.0)
        
    }
    
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if emailTextField.text != "" && passwordTextField.text != ""{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
                if error != nil{
                    print(error?.localizedDescription)
                }else{
                    print("Giriş başarılı!")
                }
            }
        }else{
            let alert = UIAlertController(title: "Hata", message: "Boş alan bırakılamaz!", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Tekrar dene", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
}

