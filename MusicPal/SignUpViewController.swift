//
//  SignUpViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 11.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    var ref: DatabaseReference!
    
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
        ref = Database.database().reference()
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
        if nameTextField.text != "" && mailTextField.text != "" && passwordTextField.text != "" && passwordAgainTextField.text != ""{
            if passwordTextField.text == passwordAgainTextField.text{
                Auth.auth().createUser(withEmail: mailTextField.text!, password: passwordTextField.text!) { authResult, error in
                    if error != nil{
                        print(error?.localizedDescription)
                    }else{
//                        self.ref.child("users").childByAutoId().setValue(["name": self.nameTextField.text!])
                        print("Kayıt başarılı!")
                        self.performSegue(withIdentifier: "completeProfile", sender: nil)
                        
                    }
                }
            }else{
                let alert = UIAlertController(title: "Hata", message: "Şifreler uyuşmuyor!", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "Tekrar dene", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "Hata", message: "Boş alan bırakılamaz!", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Tekrar dene", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
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
