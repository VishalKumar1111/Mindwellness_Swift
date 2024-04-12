//
//  CommonResultViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 07/07/22.
//

import UIKit

class CommonResultViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
//    var color = ["#FF7F50", "#9FE2BF" , "#40E0D0" , "#6495ED" , "#CCCCFF"]
    var arr: NSArray?

    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
            self.tbl.insertSubview(imageView, at: 0)
        }
       // self.tbl.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)

        //tbl.layer.cornerRadius = 20
         if let path = Bundle.main.path(forResource: "doctor", ofType: "plist") {
            arr = NSArray(contentsOfFile: path)
             print(arr!)
             
             tbl.delegate = self
             tbl.dataSource = self
    }
    
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr!.count
      
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "common", for: indexPath) as! ExTableViewCell
        
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

        print(nam)
        cell.Vw.layer.cornerRadius = 20
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchHappen(_:)))
        cell.Phone.addGestureRecognizer(tap)
        cell.Phone.isUserInteractionEnabled = true
        
//        cell.Vw.backgroundColor = hexStringToUIColor(hex: color[Int.random(in: 0..<5)])
        cell.imgS.layer.cornerRadius = 15
        func touchHappen(_ sender: UITapGestureRecognizer) {
            print("Hello Dear you are here")
        }
        
        
        cell.Name.text = nam as? String ?? ""
        cell.Clinic.text = clinic as? String ?? ""
        cell.address.text = address as? String ?? ""
        cell.Specialist.text = specialist as? String ?? ""
        cell.Degree.text = degree as? String ?? ""
        cell.Phone.text = phone as? String ?? ""
        return cell
    }
    
   
    
    @objc func touchHappen(_ sender: UITapGestureRecognizer) {
        print("Hello Friends")
       
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
   
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


