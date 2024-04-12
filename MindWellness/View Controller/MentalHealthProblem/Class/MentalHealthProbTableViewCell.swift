//
//  MentalHealthProbTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 01/01/23.
//

import UIKit

class MentalHealthProbTableViewCell: UITableViewCell {

    @IBOutlet weak var cellHeading: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImage.layer.cornerRadius = 40
        bgImage.layer.cornerRadius = 40
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
