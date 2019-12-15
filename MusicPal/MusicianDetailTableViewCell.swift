//
//  MusicianDetailTableViewCell.swift
//  MusicPal
//
//  Created by Berke Yağız Sevim on 15.12.2019.
//  Copyright © 2019 Berke Yağız Sevim. All rights reserved.
//

import UIKit

class MusicianDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundLayer: UIView!{
        didSet{
            backgroundLayer.layer.cornerRadius = 6
            backgroundLayer.backgroundColor = UIColor.white
        }
    }
    @IBOutlet weak var musicianImage: UIImageView!{
        didSet{
            musicianImage.layer.cornerRadius = 34
        }
    }
    @IBOutlet weak var musicianName: UILabel!
    
    @IBOutlet weak var musicianNeeds: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
