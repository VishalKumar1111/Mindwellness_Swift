//
//  ShowDiseaseTableViewCell.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 04/04/23.
//

import UIKit

class ShowDiseaseTableViewCell: UITableViewCell {

    @IBOutlet weak var innerViewOlt: UIView!
    @IBOutlet weak var lblOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        innerViewOlt.layer.cornerRadius = innerViewOlt.bounds.height/2
        innerViewOlt.layer.borderColor = UIColor.black.cgColor
        innerViewOlt.layer.borderWidth = 1
       // innerViewOlt.backgroundColor = UIColor(red: 0.73, green: 0.73, blue: 0.88, alpha: 1.00)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
