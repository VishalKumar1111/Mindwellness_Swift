//
//  AssessmentViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 17/08/22.
//

import UIKit

class AssessmentViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var btnLifestyle: UIButton!
    @IBOutlet weak var btnPsychatrist: UIButton!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var pshcatristBtnOlt: UIButton!
    @IBOutlet weak var imgPsychatristOlt: UIImageView!
    
    @IBOutlet weak var btnNutrition: UIButton!
    @IBOutlet weak var btnYoga: UIButton!
    @IBOutlet weak var btnPsychotrapist: UIButton!
    @IBOutlet weak var psychotherapistBtnOlt: UIButton!
    @IBOutlet weak var imgPsychotherapist: UIImageView!
    
    @IBOutlet weak var otherExpertsBtnOlt: UIButton!
    @IBOutlet weak var imgOtherExpertsOlt: UIImageView!
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.viewBackground.insertSubview(imageView, at: 0)
        }
//        self.viewBackground.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        self.pshcatristBtnOlt.layer.cornerRadius = 20
        imgPsychatristOlt.layer.cornerRadius = imgPsychatristOlt.frame.size.height/2
        imgPsychatristOlt.clipsToBounds = true
        
        self.psychotherapistBtnOlt.layer.cornerRadius = 20
        imgPsychotherapist.layer.cornerRadius = imgPsychatristOlt.frame.size.height/2
        imgPsychotherapist.clipsToBounds = true
        
        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        let presentingVC = self.presentingViewController
          self.dismiss(animated: true) {
              presentingVC?.navigationController?.popToRootViewController(animated: false)
          }
    }
    
    @IBAction func btnmentalHealth(_ sender: UIButton) {
        print("pshcatristBtnAction")
//        if btnPsychatrist.isHidden == true && btnPsychotrapist.isHidden == true{
//            btnPsychatrist.isHidden = false
//            btnPsychotrapist.isHidden = false
//        }else{
//            btnPsychatrist.isHidden = true
//            btnPsychotrapist.isHidden = true
//        }
    }
    
    @IBAction func consultation(_ sender: UIButton) {
        print("psychotherapistBtnAction")
        
        }
    
    
    @IBAction func btnLifestyle(_ sender: UIButton) {
        print("LifeStyle")
//        if btnYoga.isHidden == true && btnNutrition.isHidden == true{
//            btnYoga.isHidden = false
//            btnNutrition.isHidden = false
//        }else{
//            btnYoga.isHidden = true
//            btnNutrition.isHidden = true
//        }
    }
    
    
}
