//
//  CustomConcertTableViewCell.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 14.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class CustomConcertTableViewCell: UITableViewCell {
    @IBOutlet weak var concertImage: UIImageView!
    @IBOutlet weak var concertTitle: UILabel!
    @IBOutlet weak var concertSubDetail: UILabel!
    @IBOutlet weak var attendedPeopleNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
