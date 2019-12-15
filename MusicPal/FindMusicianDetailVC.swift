//
//  FindMusicianDetailVC.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 15.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class FindMusicianDetailVC: UIViewController {
    
    var musicianProfilePhoto = UIImage()
    var musicianName = ""
    var musicianLocation = ""
    var musicianDetailedText = ""
    var musicianAbilities = [String]()
    
    @IBOutlet weak var scrollableBackgroundView: UIView!
    @IBOutlet weak var whiteBackground: UIView!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.text = "Berke Yağız Sevim"
        }
    }
    @IBOutlet weak var locationLabel: UILabel!{
        didSet{
            locationLabel.text = "Istanbul - Turkey"
        }
    }
    @IBOutlet weak var contactButton: UIButton!{
        didSet{
            contactButton.layer.cornerRadius = 13.5
        }
    }
    
    @IBOutlet weak var detailedTextBackground: UIView!{
        didSet{
            detailedTextBackground.backgroundColor = UIColor.white
            detailedTextBackground.layer.cornerRadius = 6
            detailedTextBackground.layer.shadowColor = #colorLiteral(red: 0.8901960784, green: 0.8901960784, blue: 0.8901960784, alpha: 1)
            detailedTextBackground.layer.shadowOpacity = 0.5
            detailedTextBackground.layer.shadowOffset = CGSize(width: 0, height: 2)
            detailedTextBackground.layer.shadowRadius = 28
        }
    }
    
    @IBOutlet weak var detailedTextLabel: UILabel!{
        didSet{
            detailedTextLabel.text = "Hello, my name is Yagiz from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!"
        }
    }
    
    @IBOutlet weak var musicianDetailTableView: UITableView!{
        didSet{
            musicianDetailTableView.backgroundColor = UIColor.clear
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = musicianName
        profilePhoto.image = musicianProfilePhoto
        locationLabel.text = musicianLocation
        detailedTextLabel.text = musicianDetailedText
        
        setupUI()
        musicianDetailTableView.delegate = self
        musicianDetailTableView.dataSource = self
    }
    
    @IBAction func contactButtonClicked(_ sender: UIButton) {
    }
    
    func setupUI(){
        
        let whiteBackground = UIView()
        whiteBackground.backgroundColor = UIColor.white
        let whiteBackgroundHeight: CGFloat = 380
        
        let backgroundLayer = UIView()
        let height:CGFloat = 150
        let width:CGFloat = 150
        
        scrollableBackgroundView.addSubview(whiteBackground)
        
        // MARK: White Background Constraint
        whiteBackground.translatesAutoresizingMaskIntoConstraints = false
        whiteBackground.topAnchor.constraint(equalTo: scrollableBackgroundView.topAnchor).isActive = true
        whiteBackground.heightAnchor.constraint(equalToConstant: whiteBackgroundHeight).isActive = true
        whiteBackground.centerXAnchor.constraint(equalTo: scrollableBackgroundView.centerXAnchor).isActive = true
        
        whiteBackground.leadingAnchor.constraint(equalTo: scrollableBackgroundView.leadingAnchor).isActive = true
        whiteBackground.trailingAnchor.constraint(equalTo: scrollableBackgroundView.trailingAnchor).isActive = true
        backgroundLayer.layer.cornerRadius = height / 2
        
        // MARK: Background Layer Constraint
        backgroundLayer.translatesAutoresizingMaskIntoConstraints = false
        backgroundLayer.backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.2352941176, blue: 0.9215686275, alpha: 1)
        whiteBackground.addSubview(backgroundLayer)
        
        backgroundLayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundLayer.heightAnchor.constraint(equalToConstant: height).isActive = true
        backgroundLayer.widthAnchor.constraint(equalToConstant: width).isActive = true
        backgroundLayer.topAnchor.constraint(equalTo: whiteBackground.topAnchor, constant: 15).isActive = true
        
        // MARK: Profile Picture Constraint
        
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
        profilePhoto.centerYAnchor.constraint(equalTo: backgroundLayer.centerYAnchor).isActive = true
        profilePhoto.centerXAnchor.constraint(equalTo: backgroundLayer.centerXAnchor).isActive = true
        profilePhoto.heightAnchor.constraint(equalToConstant: height-10).isActive = true
        profilePhoto.widthAnchor.constraint(equalToConstant: width-10).isActive = true
        profilePhoto.layer.cornerRadius = ((height - 10) / 2)
        
        // MARK: Name Label Constraint
        
        backgroundLayer.addSubview(profilePhoto)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        whiteBackground.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: backgroundLayer.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: whiteBackground.leadingAnchor, constant: 20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: whiteBackground.trailingAnchor, constant: -20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor).isActive = true
        // MARK: Location Label Constraints
        
        whiteBackground.addSubview(locationLabel)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: whiteBackground.leadingAnchor, constant: 20).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: whiteBackground.trailingAnchor, constant: -20).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor).isActive = true
        
        // MARK: Contact Button Constraints
        
        whiteBackground.addSubview(contactButton)
        
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        contactButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5).isActive = true
        contactButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        contactButton.widthAnchor.constraint(equalToConstant: 131).isActive = true
        contactButton.centerXAnchor.constraint(equalTo: whiteBackground.centerXAnchor).isActive = true
        
        // MARK: Detail Background Layer Constraints
        
        backgroundLayer.addSubview(detailedTextBackground)
        detailedTextBackground.translatesAutoresizingMaskIntoConstraints = false
        detailedTextBackground.topAnchor.constraint(equalTo: contactButton.bottomAnchor, constant: 15).isActive = true
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
        
        detailedTextBackground.addSubview(detailedTextLabel)
        detailedTextLabel.translatesAutoresizingMaskIntoConstraints = false
        detailedTextLabel.topAnchor.constraint(equalTo: detailedTextBackground.topAnchor, constant: 10).isActive = true
        detailedTextLabel.bottomAnchor.constraint(equalTo: detailedTextBackground.bottomAnchor, constant: -10).isActive = true
        detailedTextLabel.leadingAnchor.constraint(equalTo: detailedTextBackground.leadingAnchor, constant: 5).isActive = true
        detailedTextLabel.trailingAnchor.constraint(equalTo: detailedTextBackground.trailingAnchor, constant: -5).isActive = true
        detailedTextLabel.centerXAnchor.constraint(equalTo: detailedTextBackground.centerXAnchor).isActive = true
        detailedTextLabel.heightAnchor.constraint(equalToConstant: 92).isActive = true
        
        // MARK: Table View Constraints
        
        scrollableBackgroundView.addSubview(musicianDetailTableView)
        musicianDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        musicianDetailTableView.topAnchor.constraint(equalTo: whiteBackground.bottomAnchor, constant: 5).isActive = true
        musicianDetailTableView.leadingAnchor.constraint(equalTo: scrollableBackgroundView.leadingAnchor, constant: 35).isActive = true
        musicianDetailTableView.trailingAnchor.constraint(equalTo: scrollableBackgroundView.trailingAnchor, constant: -35).isActive = true
        musicianDetailTableView.centerXAnchor.constraint(equalTo: scrollableBackgroundView.centerXAnchor).isActive = true
        
        
    }
}

extension FindMusicianDetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicianDetailTableView.dequeueReusableCell(withIdentifier: "musicianDetails", for: indexPath) as! MusicianInformationTableViewCell
        cell.detailedText.text = musicianAbilities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
}
