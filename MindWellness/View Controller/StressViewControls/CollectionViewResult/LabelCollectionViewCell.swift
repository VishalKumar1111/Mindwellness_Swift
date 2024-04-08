//
//  LabelCollectionViewCell.swift
//  MindWellness
//
//  Created by RLogixxTraining on 08/02/24.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CustomCell"
       
       let label: UILabel = {
           let label = UILabel()
           label.textAlignment = .center
           label.textColor = .white
           label.numberOfLines = 4 // Allow multiple lines
           label.lineBreakMode = .byWordWrapping // Set line break mode
           return label
       }()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupLabel()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupLabel()
       }
       
       private func setupLabel() {
           addSubview(label)
           label.translatesAutoresizingMaskIntoConstraints = false
           
           // Set constraints for label with leading and trailing margins
           NSLayoutConstraint.activate([
               label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // Leading margin set to 18
               label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), // Trailing margin set to -18
               label.topAnchor.constraint(equalTo: topAnchor, constant: 2),
               label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
           ])
           
           // Set font size
           label.font = UIFont.systemFont(ofSize: 25) // Adjust the size as needed
           
           // Set number of lines to 0 for multiline support
           label.numberOfLines = 0
           label.lineBreakMode = .byWordWrapping // Set line break mode
       }
   }
