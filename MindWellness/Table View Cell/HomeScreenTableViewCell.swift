//
//  HomeScreenTableViewCell.swift
//  MindWellness
//
//  Created by iOS Training on 22/07/21.
//

import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    @IBOutlet weak var imgViewHomeScreen: UIImageView!
    @IBOutlet weak var lblTxtHomeScreen: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
