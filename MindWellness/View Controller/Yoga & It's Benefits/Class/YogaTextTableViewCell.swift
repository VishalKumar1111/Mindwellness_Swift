//
//  YogaTextTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 30/12/22.
//

import UIKit

class YogaTextTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfTextSide: UIImageView!
    @IBOutlet weak var aasanNamelbl: UILabel!
    @IBOutlet weak var aasanDetailsTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
