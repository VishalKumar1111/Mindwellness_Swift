//
//  PossibleTreatmentViewController.swift
//  MindWellness
//
//  Created by iOS Training on 22/07/21.
//

import UIKit

class PossibleTreatmentViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tblViewPossibleInvestigation: UITableView!
    
    var arrImage = [String]()
    var arrOptionName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        
        arrImage = [ "twelve.jpg" ,"eleven.jpg", "thirteen.jpg" , "one.jpg" , "hospitalization.jpeg"]
        arrOptionName = [ " Psychotherapy" , "Medication", "Art" , "Life Style Changes" , "Those Who Can Help You"]
        
        tblViewPossibleInvestigation.delegate = self
        tblViewPossibleInvestigation.dataSource = self
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOptionName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "possibletreatmentcell", for: indexPath) as! PossibleTreatmentTableViewCell
        
        cell.imgViewPossibleTreatment.image = UIImage(named: arrImage[indexPath.row])
        cell.lblTextPossibleTreatment.text = arrOptionName[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 324
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        if  indexPath.row == 0 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
           // self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
        if  indexPath.row == 1 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
           // self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
        if  indexPath.row == 2 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
         //   self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
        if  indexPath.row == 3 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
          //  self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
        if  indexPath.row == 4 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
          //  self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
        if  indexPath.row == 5 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
          //  self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
