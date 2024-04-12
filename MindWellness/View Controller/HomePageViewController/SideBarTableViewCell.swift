//
//  SideBarTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 27/12/22.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOfContents: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
