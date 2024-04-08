//
//  CollectionYoga.swift
//  MindWellness
//
//  Created by RLogixxTraining on 15/12/23.
//

import UIKit

class CollectionYoga: UICollectionViewCell {

    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var imgYoga: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        // Initialization code
    }

}
