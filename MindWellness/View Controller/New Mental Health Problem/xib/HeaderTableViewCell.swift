//
//  HeaderTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 23/02/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var backgroundViewOutlet: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundViewOutlet.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
        backgroundViewOutlet.layer.cornerRadius = 20
        imgView.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
