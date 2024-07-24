//
//  ExpertViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 05/12/23.
//

import UIKit

class ExpertViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var txtTitle: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    var arr:NSArray?
    var heading:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitle.text = "expert".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")


        if let path = Bundle.main.path(forResource: "doctor", ofType: "plist") {
           arr = NSArray(contentsOfFile: path)
            print(heading)
            print(arr!)
            
            tblView.delegate = self
            tblView.dataSource = self
            if let backgroundImage = UIImage(named: "Background") {
                let imageView = UIImageView(frame: self.view.bounds)
                imageView.contentMode = .scaleAspectFill
                imageView.image = backgroundImage
                self.view.insertSubview(imageView, at: 0)
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr!.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dic = arr?[indexPath.row] as? NSDictionary
        let nam = dic?["Name"] as? String ?? ""
        let dic1 = arr?[indexPath.row] as? NSDictionary
        let clinic = dic1?["Clinic"] as? String ?? ""
        let dic2 = arr?[indexPath.row] as? NSDictionary
        let address = dic2?["Address"] as? String ?? ""
        let dic3 = arr?[indexPath.row] as? NSDictionary
        let specialist = dic3?["Specialist"] as? String ?? ""
        let dic4 = arr?[indexPath.row] as? NSDictionary
        let degree = dic4?["Degree"] as? String ?? ""
        let dic5 = arr?[indexPath.row] as? NSDictionary
        let phone  = dic5?["Phone No."] as? String ?? ""
        
        let identifier = "expert"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ExpertsTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ExpertsTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ExpertsTableViewCell
            
            
        }
 
        if specialist.contains(heading) {
               cell?.txtName.text = nam
               cell?.txtClinic.text = clinic
               cell?.txtAddress.text = address
               cell?.txtSpeciality.text = specialist
               cell?.txtCourse.text = degree
               cell?.txtPhone.text = phone
               cell?.img.image = UIImage(named: "professional")
               return cell!
        }else if heading.isEmpty{
            cell?.txtName.text = nam
            cell?.txtClinic.text = clinic
            cell?.txtAddress.text = address
            cell?.txtSpeciality.text = specialist
            cell?.txtCourse.text = degree
            cell?.txtPhone.text = phone
            cell?.img.image = UIImage(named: "professional")
            return cell!
        }else {
            let emptyCell = UITableViewCell()
               emptyCell.backgroundColor = .clear // Set background color to clear
               return emptyCell
           }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dic = arr?[indexPath.row] as? NSDictionary
           let specialist = dic?["Specialist"] as? String ?? ""
           
           // Check if the specialist contains the heading or if the heading is empty
           if specialist.contains(heading) || heading.isEmpty {
               return 320.0 // Return the normal height if the condition is met or if heading is empty
           } else {
               return 0 // Return 0 height for the row if the condition is not met
           }
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
