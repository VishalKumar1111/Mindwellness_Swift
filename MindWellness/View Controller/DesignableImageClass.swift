//
//  DesignableImageClass.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 31/12/22.
//

import UIKit

@IBDesignable class DesignableImage: UIImageView {
   @IBInspectable var cornerRadius:CGFloat = 0.0{
       didSet{
         self.layer.cornerRadius = cornerRadius
           self.clipsToBounds = true
       }
   }
   @IBInspectable var borderWidth: Double {
       get {
           return Double(self.layer.borderWidth)
       }
       set {
           self.layer.borderWidth = CGFloat(newValue)
       }
   }
   @IBInspectable var borderColor: UIColor? {
       get {
           return UIColor(cgColor: self.layer.borderColor!)
       }
       set {
           self.layer.borderColor = newValue?.cgColor
       }
   }
   @IBInspectable var shadowColor: UIColor? {
       get {
           return UIColor(cgColor: self.layer.shadowColor!)
       }
       set {
           self.layer.shadowColor = newValue?.cgColor
       }
   }
   @IBInspectable var shadowOpacity: Float {
       get {
           return self.layer.shadowOpacity
       }
       set {
           self.layer.shadowOpacity = newValue
       }
   }
}

@IBDesignable class DesignableLabel: UILabel {
   @IBInspectable var cornerRadius:CGFloat = 0.0{
       didSet{
           self.layer.cornerRadius = cornerRadius
           self.clipsToBounds = true
       }
    }
 }

