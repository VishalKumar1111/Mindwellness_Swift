//
//  PossibleInvestigationViewController.swift
//  MindWellness
//
//  Created by iOS Training on 22/07/21.
//

import UIKit

class PossibleInvestigationViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    @IBOutlet weak var tblViewPossibleInvestigation: UITableView!
    
    var arrImages = [String]()
    var arrOptionName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }

        arrImages = ["seventeen.jpg" , "fourteen.jpg" , "one.jpg" , "sixteen.jpg"]
        arrOptionName = ["Doctor" , " Counsellor" , "Yoga" , "Free Meditation"]
        
        tblViewPossibleInvestigation.delegate = self
        tblViewPossibleInvestigation.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOptionName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "possibleinvestigationcell", for: indexPath) as! PossibleInvestigationTableViewCell
        
        cell.imgViewPossibleInvestigationCell.image = UIImage(named: arrImages[indexPath.row])
        cell.lblTextPossibleInvestigationCell.text = arrOptionName[indexPath.row]
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
            
            self.present(CommonVC!, animated:false, completion:nil)
    }
        
        if  indexPath.row == 1 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
            self.present(CommonVC!, animated:false, completion:nil)
    }
        if  indexPath.row == 2 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
            self.present(CommonVC!, animated:false, completion:nil)
    }
        if  indexPath.row == 3 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
            self.present(CommonVC!, animated:false, completion:nil)
    }
    
        if  indexPath.row == 4 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
            self.present(CommonVC!, animated:false, completion:nil)
    }
        
        if  indexPath.row == 5 {
            let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "common1") as? CommonResultViewController
            
            self.present(CommonVC!, animated:false, completion:nil)
    }
    }
    
}
