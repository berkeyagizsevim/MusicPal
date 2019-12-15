//
//  FindMusiciansViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 12.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class FindMusiciansViewController: UIViewController {
    
    var rockMusicData = [MusicianData]()
    var rnbMusicData = [MusicianData]()
    var jazzMusicData = [MusicianData]()
    
    
    var musicianName = ""
    var musicianImage = UIImage()
    var musicianNeeds = ""
    var musicianLocation = ""
    var musicianDescription = ""
    var musicianDetails = [String]()
    
    
    func createData(){
        let rockMusician1 = MusicianData(name: "Daniel Oalnes", image: "man-1", needs: "looking for a guitarist for playing a Rock ", location: "Istanbul - Turkey", description: "Hello, my name is Yagiz from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!", details: ["5 year experience on music industry. Freelance song writer.","playing guitar for 10 years. Best solo guitarist in this town. He loves Michael Jordan.","he is looking for piano artist from Istanbul. Also wants to play in public transportation.","he loves Jazz, RnB, HipHop music. "])
        rockMusicData.append(rockMusician1)
        
        let rnbMusician1 =  MusicianData(name: "Kaan Tangöze", image: "man-2", needs: "looking for a pianist for playing a Rock ", location: "Bursa - Turkey", description: "Hello, my name is Kaan from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!", details: ["5 year experience on music industry. Freelance song writer.","playing guitar for 10 years. Best solo guitarist in this town. He loves Michael Jordan.","he is looking for piano artist from Istanbul. Also wants to play in public transportation.","he loves Jazz, RnB, HipHop music. "])
        let rnbMusician2 =  MusicianData(name: "Buse Bekledim", image: "woman-1", needs: "looking for a solist for playing a Rock ", location: "İzmir - Turkey", description: "Hello, my name is Kaan from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!", details: ["5 year experience on music industry. Freelance song writer.","playing guitar for 10 years. Best solo guitarist in this town. He loves Michael Jordan.","he is looking for piano artist from Istanbul. Also wants to play in public transportation.","he loves Jazz, RnB, HipHop music. "])
        rnbMusicData.append(rnbMusician1)
        rnbMusicData.append(rnbMusician2)
        
        let jazzMusician1 = MusicianData(name: "Hailey Opaw", image: "woman-2", needs: "looking for a solist for playing a Rock ", location: "Yalova - Turkey", description: "Hello, my name is Kaan from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!", details: ["5 year experience on music industry. Freelance song writer.","playing guitar for 10 years. Best solo guitarist in this town. He loves Michael Jordan.","he is looking for piano artist from Istanbul. Also wants to play in public transportation.","he loves Jazz, RnB, HipHop music. "])
        let jazzMusician2 = MusicianData(name: "Sercan Can", image: "man-3", needs: "looking for a solist for playing a Rock ", location: "Kırklareli - Turkey", description: "Hello, my name is Kaan from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!", details: ["5 year experience on music industry. Freelance song writer.","playing guitar for 10 years. Best solo guitarist in this town. He loves Michael Jordan.","he is looking for piano artist from Istanbul. Also wants to play in public transportation.","he loves Jazz, RnB, HipHop music. "])
        let jazzMusician3 = MusicianData(name: "Hülya Canyılmaz", image: "woman-3", needs: "looking for a safasfas for playing a Rock ", location: "İzmit - Turkey", description: "Hello, my name is Kaan from Turkey! 🇹🇷 I love playing guitar. Mostly i like playing Jazz. We if you are interested in Jazz around Besiktas, text me or hire me!", details: ["5 year experience on music industry. Freelance song writer.","playing guitar for 10 years. Best solo guitarist in this town. He loves Michael Jordan.","he is looking for piano artist from Istanbul. Also wants to play in public transportation.","he loves Jazz, RnB, HipHop music. "])
        jazzMusicData.append(jazzMusician1)
        jazzMusicData.append(jazzMusician2)
        jazzMusicData.append(jazzMusician3)
        
        
    }
    
    @IBOutlet weak var musicTypeSegment: UISegmentedControl!{
        didSet{
            musicTypeSegment.tintColor = UIColor.white
            musicTypeSegment.selectedSegmentTintColor = #colorLiteral(red: 0.3803921569, green: 0.2352941176, blue: 0.9215686275, alpha: 1)
            musicTypeSegment.backgroundColor = UIColor.white
        }
    }
    @IBOutlet weak var musicianTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        musicianTableView.delegate = self
        musicianTableView.dataSource = self
        musicTypeSegment.translatesAutoresizingMaskIntoConstraints = false
        musicTypeSegment.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(musicTypeSegment)
    }
    
    @IBAction func segmentClicked(_ sender: UISegmentedControl) {
        musicianTableView.reloadData()
    }
    
    
    
    
}
extension FindMusiciansViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = 0
        switch musicTypeSegment.selectedSegmentIndex{
        case 0:
            value = rockMusicData.count
        case 1:
            value = rnbMusicData.count
        case 2:
            value = jazzMusicData.count
        default:
            break
        }
        return value
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toMusicianDetails", for: indexPath) as! MusicianDetailTableViewCell
        switch musicTypeSegment.selectedSegmentIndex {
        case 0:
            cell.musicianName.text = rockMusicData[indexPath.row].name
            cell.musicianImage.image = UIImage(named: "\(rockMusicData[indexPath.row].image)")
            cell.musicianNeeds.text = rockMusicData[indexPath.row].needs
        case 1:
            cell.musicianName.text = rnbMusicData[indexPath.row].name
            cell.musicianImage.image = UIImage(named: "\(rnbMusicData[indexPath.row].image)")
            cell.musicianNeeds.text = rnbMusicData[indexPath.row].needs
        case 2:
            cell.musicianName.text = jazzMusicData[indexPath.row].name
            cell.musicianImage.image = UIImage(named: "\(jazzMusicData[indexPath.row].image)")
            cell.musicianNeeds.text = jazzMusicData[indexPath.row].needs
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch musicTypeSegment.selectedSegmentIndex {
        case 0:
            musicianName = rockMusicData[indexPath.row].name
            musicianImage = UIImage(named: "\(rockMusicData[indexPath.row].image)")!
            musicianNeeds = rockMusicData[indexPath.row].needs
            musicianLocation = rockMusicData[indexPath.row].location
            musicianDescription = rockMusicData[indexPath.row].description
            musicianDetails = rockMusicData[indexPath.row].details
        case 1:
            musicianName = rnbMusicData[indexPath.row].name
            musicianImage = UIImage(named: "\(rnbMusicData[indexPath.row].image)")!
            musicianNeeds = rnbMusicData[indexPath.row].needs
            musicianLocation = rnbMusicData[indexPath.row].location
            musicianDescription = rnbMusicData[indexPath.row].description
            musicianDetails = rnbMusicData[indexPath.row].details
        case 2:
            musicianName = jazzMusicData[indexPath.row].name
            musicianImage = UIImage(named: "\(jazzMusicData[indexPath.row].image)")!
            musicianNeeds = jazzMusicData[indexPath.row].needs
            musicianLocation = jazzMusicData[indexPath.row].location
            musicianDescription = jazzMusicData[indexPath.row].description
            musicianDetails = jazzMusicData[indexPath.row].details
        default:
            break
        }
        performSegue(withIdentifier: "findMusiciansDetailVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "findMusiciansDetailVC"{
            if let destinationVC = segue.destination as? FindMusicianDetailVC{
                destinationVC.musicianName = musicianName
                destinationVC.musicianLocation = musicianLocation
                destinationVC.musicianProfilePhoto = musicianImage
                destinationVC.musicianDetailedText = musicianDescription
                destinationVC.musicianAbilities = musicianDetails
            }
            
        }
    }
    
    
    
    
    
    
}
