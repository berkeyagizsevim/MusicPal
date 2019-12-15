//
//  MusicianInformationTableViewCell.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 15.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class MusicianInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundCircle: UIView!{
        didSet{
            backgroundCircle.layer.cornerRadius = 25
        }
    }
    
    @IBOutlet weak var abilityLogo: UIImageView!
    
    @IBOutlet weak var detailedText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
