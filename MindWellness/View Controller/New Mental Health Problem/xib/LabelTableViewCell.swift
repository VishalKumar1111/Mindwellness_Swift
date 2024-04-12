//
//  LabelTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 23/02/23.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak var seeAllButtonOutlet: UIButton!
    @IBOutlet weak var backgroundViewOutlet: UIView!
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        // Initialization code
        backgroundViewOutlet.layer.cornerRadius = 20
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
