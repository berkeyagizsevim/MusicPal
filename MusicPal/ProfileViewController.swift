//
//  ProfileViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 11.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var scrollableBackground: UIView!{
        didSet{
            scrollableBackground.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        }
    }
    

    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var profilePicture: UIImageView!{
        didSet{
            profilePicture.image = UIImage(named: "profile-pic")
        }
    }
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.text = "Berke Yağız Sevim"
        }
    }
    
    @IBOutlet weak var locationLabel: UILabel!{
        didSet{
            locationLabel.text = "Istanbul  -  Turkey"
        }
    }
    
    @IBOutlet weak var detailedTextBackground: UIView!{
        didSet{
            detailedTextBackground.layer.cornerRadius = 6
            detailedTextBackground.layer.shadowColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
            detailedTextBackground.layer.shadowOpacity = 0.5
            detailedTextBackground.layer.shadowOffset = CGSize(width: 0, height: 2)
            detailedTextBackground.layer.shadowRadius = 28
        }
    }
    @IBOutlet weak var profileDetailText: UILabel!
    @IBOutlet weak var profileDetailTableView: UITableView!{
        didSet{
            profileDetailTableView.backgroundColor = UIColor.clear
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileDetailTableView.delegate = self
        profileDetailTableView.dataSource = self
        setupUI()
    }
    
    func setupUI(){
            
            let whiteBackground = UIView()
            whiteBackground.backgroundColor = UIColor.white
            let whiteBackgroundHeight: CGFloat = 380
            
            let backgroundLayer = UIView()
            let height:CGFloat = 150
            let width:CGFloat = 150
            scrollableBackground.addSubview(whiteBackground)
        
            
            // MARK: White Background Constraint
            whiteBackground.translatesAutoresizingMaskIntoConstraints = false
            whiteBackground.topAnchor.constraint(equalTo: scrollableBackground.topAnchor).isActive = true
            whiteBackground.heightAnchor.constraint(equalToConstant: whiteBackgroundHeight).isActive = true
            whiteBackground.centerXAnchor.constraint(equalTo: scrollableBackground.centerXAnchor).isActive = true
            
            whiteBackground.leadingAnchor.constraint(equalTo: scrollableBackground.leadingAnchor).isActive = true
            whiteBackground.trailingAnchor.constraint(equalTo: scrollableBackground.trailingAnchor).isActive = true
            
            
            backgroundLayer.layer.cornerRadius = height / 2
        
            // MARK: Background Layer Constraint
            backgroundLayer.translatesAutoresizingMaskIntoConstraints = false
                  backgroundLayer.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.2352941176, blue: 0.9215686275, alpha: 1)
            whiteBackground.addSubview(backgroundLayer)
            
            backgroundLayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            backgroundLayer.heightAnchor.constraint(equalToConstant: height).isActive = true
            backgroundLayer.widthAnchor.constraint(equalToConstant: width).isActive = true
            backgroundLayer.topAnchor.constraint(equalTo: whiteBackground.topAnchor, constant: 45).isActive = true
            
            // MARK: Profile Picture Constraint
            
            profilePicture.translatesAutoresizingMaskIntoConstraints = false
            profilePicture.centerYAnchor.constraint(equalTo: backgroundLayer.centerYAnchor).isActive = true
            profilePicture.centerXAnchor.constraint(equalTo: backgroundLayer.centerXAnchor).isActive = true
            profilePicture.heightAnchor.constraint(equalToConstant: height-10).isActive = true
            profilePicture.widthAnchor.constraint(equalToConstant: width-10).isActive = true
            profilePicture.layer.cornerRadius = ((height - 10) / 2)
            
            
            // MARK: Name Label Constraint
            
            backgroundLayer.addSubview(profilePicture)
            
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            whiteBackground.addSubview(nameLabel)
            nameLabel.topAnchor.constraint(equalTo: backgroundLayer.bottomAnchor, constant: 16).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: whiteBackground.leadingAnchor, constant: 20).isActive = true
            nameLabel.trailingAnchor.constraint(equalTo: whiteBackground.trailingAnchor, constant: -20).isActive = true
            nameLabel.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor).isActive = true
            
            // MARK: Location Label Constraints
            
            whiteBackground.addSubview(locationLabel)
            
            locationLabel.translatesAutoresizingMaskIntoConstraints = false
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
            locationLabel.leadingAnchor.constraint(equalTo: whiteBackground.leadingAnchor, constant: 20).isActive = true
            locationLabel.trailingAnchor.constraint(equalTo: whiteBackground.trailingAnchor, constant: -20).isActive = true
            locationLabel.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor).isActive = true
            
            // MARK: Detail Background Layer Constraints
            
            backgroundLayer.addSubview(detailedTextBackground)
            detailedTextBackground.translatesAutoresizingMaskIntoConstraints = false
            detailedTextBackground.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 15).isActive = true
            detailedTextBackground.leadingAnchor.constraint(equalTo: whiteBackground.leadingAnchor, constant: 35).isActive = true
            detailedTextBackground.trailingAnchor.constraint(equalTo: whiteBackground.trailingAnchor, constant: -35).isActive = true
            detailedTextBackground.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor).isActive = true
            detailedTextBackground.heightAnchor.constraint(equalToConstant: 92).isActive = true
            
            // MARK: Detail Background Left View Constraints
            
            let leftView = UIView()
            detailedTextBackground.addSubview(leftView)
            leftView.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.2352941176, blue: 0.9215686275, alpha: 1)
            leftView.layer.cornerRadius = 6

            leftView.translatesAutoresizingMaskIntoConstraints = false
            leftView.rightAnchor.constraint(equalTo: detailedTextBackground.leftAnchor).isActive = true
            leftView.heightAnchor.constraint(equalToConstant: 92 ).isActive = true
            leftView.widthAnchor.constraint(equalToConstant: 7 ).isActive = true
            
            // MARK: Profile Detail Text Constraints
            
            detailedTextBackground.addSubview(profileDetailText)
            profileDetailText.translatesAutoresizingMaskIntoConstraints = false
            profileDetailText.topAnchor.constraint(equalTo: detailedTextBackground.topAnchor, constant: 10).isActive = true
            profileDetailText.bottomAnchor.constraint(equalTo: detailedTextBackground.bottomAnchor, constant: -10).isActive = true
            profileDetailText.leadingAnchor.constraint(equalTo: detailedTextBackground.leadingAnchor, constant: 5).isActive = true
            profileDetailText.trailingAnchor.constraint(equalTo: detailedTextBackground.trailingAnchor, constant: -5).isActive = true
            profileDetailText.centerXAnchor.constraint(equalTo: detailedTextBackground.centerXAnchor).isActive = true
            profileDetailText.heightAnchor.constraint(equalToConstant: 92).isActive = true
           
            // MARK: Table View Constraints
            
            scrollableBackground.addSubview(profileDetailTableView)
            profileDetailTableView.translatesAutoresizingMaskIntoConstraints = false
            profileDetailTableView.topAnchor.constraint(equalTo: whiteBackground.bottomAnchor, constant: 30).isActive = true
            profileDetailTableView.leadingAnchor.constraint(equalTo: scrollableBackground.leadingAnchor, constant: 35).isActive = true
            profileDetailTableView.trailingAnchor.constraint(equalTo: scrollableBackground.trailingAnchor, constant: -35).isActive = true
            profileDetailTableView.centerXAnchor.constraint(equalTo: scrollableBackground.centerXAnchor).isActive = true
           
    }
    
    @IBAction func settingsButtonClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "profileSettingsClicked", sender: nil)
    }

    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileCustomTableViewCell
        cell.detailedText.text = "Berke Yağız Sevim"
        cell.backgroundImage.image = UIImage(named: "guitar")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 92
    }
    
    
    
}
