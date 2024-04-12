//
//  MentalHealthContentsTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 31/12/22.
//

import UIKit

class MentalHealthContentsTableViewCell: UITableViewCell {
    @IBOutlet weak var viewForbg: UIView!
    @IBOutlet weak var cellSubHeading: UILabel!
    @IBOutlet weak var cellHeading: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewForbg.layer.cornerRadius = 40
        bgImage.layer.cornerRadius = 40
        cellImage.layer.cornerRadius = 30
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
