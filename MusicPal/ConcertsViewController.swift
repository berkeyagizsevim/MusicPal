//
//  ConcertsViewController.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 12.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit


var concertData = [ConcertData]()

class ConcertsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.backgroundColor = UIColor.clear
        }
    }
    
    var selectedConcertName = ""
    var selectedConcertDetail = ""
    var selectedConcertImage = UIImage()
    var selectedConcertDetailText = ""
    var selectedConcertDate = ""
    var selectedConcertAttendeeNumber = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Dummy Concert Data
        let concert1 = ConcertData(concertName: "GOOD BYE 2019 👋🏻", concertDetail: "Chrismast Party", attendNumber: "61 going", concertImage: "concert-1", aboutConcert: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", concertDate: "21 Feb 2020", detailedText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        let concert2 = ConcertData(concertName: "EZHEL & BEN FERO🔥", concertDetail: "Special Türkü Bar Event ", attendNumber: "1029 going", concertImage: "concert-2", aboutConcert: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", concertDate: "21 Feb 2020", detailedText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        let concert3 = ConcertData(concertName: "GÖKHAN T. 👋🏻", concertDetail: "New album release", attendNumber: "61 going", concertImage: "concert-3", aboutConcert: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", concertDate: "21 Feb 2020", detailedText: "Kendine özgü ses rengi ve tarzıyla pop müziğin güçlü isimlerinden Gökhan Türkmen, geçtiğimiz sene başladığı ve büyük ilgi gören akustik konserlerine Bayhan Prodüksiyon organizasyonuyla 18 Aralık'ta Bostancı Gösteri Merkezi'nde devam ediyor.Değerli müzisyenlerden oluşan GT Band ile unutulmaz konserlere imza atan sanatçı, Sessiz albümünün beşinci video klibini çektiği Aşktır şarkısı ile çalışmalarına devam ediyor.")
        let concert4 = ConcertData(concertName: "ARIANA GRANDE", concertDetail: "Album release", attendNumber: "1201 going", concertImage: "concert-4", aboutConcert: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", concertDate: "21 Feb 2020", detailedText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        let concert5 = ConcertData(concertName: "GOOD BYE 2019 👋🏻", concertDetail: "Chrismast Party", attendNumber: "61 going", concertImage: "concert-5", aboutConcert: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", concertDate: "21 Feb 2020", detailedText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        concertData.append(concert1)
        concertData.append(concert2)
        concertData.append(concert3)
        concertData.append(concert4)
        concertData.append(concert5)
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
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

extension ConcertsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concertData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "concertCell", for: indexPath) as! CustomConcertTableViewCell
        cell.concertTitle.text = concertData[indexPath.row].concertName
        cell.concertSubDetail.text = concertData[indexPath.row].concertDetail
        cell.attendedPeopleNumber.text = concertData[indexPath.row].attendNumber
        cell.concertImage.image = UIImage(named: "\(concertData[indexPath.row].concertImage)")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedConcertName = concertData[indexPath.row].concertName
        selectedConcertImage = UIImage(named: "\(concertData[indexPath.row].concertImage)")!
        selectedConcertDetail = concertData[indexPath.row].concertDetail
        selectedConcertDate = concertData[indexPath.row].concertDate
        selectedConcertAttendeeNumber = concertData[indexPath.row].attendNumber
        selectedConcertDetailText = concertData[indexPath.row].detailedText
        performSegue(withIdentifier: "toConcertDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConcertDetail"{
            if let destinationVC = segue.destination as? ConcertDetailViewController{
                destinationVC.nameOfConcert = selectedConcertName
                destinationVC.dateOfConcert = selectedConcertDate
                destinationVC.imageOfConcert = selectedConcertImage
                destinationVC.detailOfConcert = selectedConcertDetail
                destinationVC.peopleCount = selectedConcertAttendeeNumber
                destinationVC.detailedTextAboutConcert = selectedConcertDetailText
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
}

