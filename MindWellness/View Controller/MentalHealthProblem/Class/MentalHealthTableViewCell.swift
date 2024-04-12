//
//  MentalHealthTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 31/12/22.
//

import UIKit

class MentalHealthTableViewCell: UITableViewCell {

    @IBOutlet weak var cellDesc: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var cellHeading: UILabel!
    @IBOutlet weak var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        //self.viewBackground.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.viewBackground.layer.cornerRadius = 20
        self.cellImage.layer.cornerRadius = self.cellImage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
