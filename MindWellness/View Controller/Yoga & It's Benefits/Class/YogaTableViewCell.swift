//
//  YogaTableViewCell.swift
//  MindWellness
//
//  Created by RLogixxTraining on 17/11/22.
//

import UIKit

class YogaTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var YogaShortDetailOnCellLabel: UILabel!
    @IBOutlet weak var textVIdeoimage: UIImageView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var lblofName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellImage.layer.cornerRadius = self.cellImage.frame.height/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
