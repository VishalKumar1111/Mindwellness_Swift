//
//  StressScreenTableViewCell.swift
//  MindWellness
//
//  Created by iOS Training on 28/07/21.
//

import UIKit

class StressScreenTableViewCell: UITableViewCell {
    @IBOutlet weak var imgViewStressCell: UIImageView!
    @IBOutlet weak var lblTextStressCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
