//
//  ProfileDetailsTableViewCell.swift
//  
//
//  Created by Berke Yağız Sevim on 14.12.2019.
//

import UIKit

class ProfileDetailsTableViewCell: UITableViewCell {
    @IBOutlet var backgroundCircle: UIView!{
        didSet{
            backgroundCircle.layer.cornerRadius = 50/2
        }
    }
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellDetailText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //MARK: Background circle created
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
