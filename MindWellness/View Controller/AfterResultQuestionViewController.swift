//
//  AfterResultQuestionViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 30/06/22.
//

import UIKit

class AfterResultQuestionViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var backgroundViewTbl: UIView!
    @IBOutlet weak var connectBtnOutlet: UIButton!
    @IBOutlet weak var afterResultTblView: UITableView!
    
    @IBOutlet weak var backBtnOutlet: UIButton!
    
    
    //MARK: Properties
  
    var arrOfResult = [String]()
    
 //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        connectBtnOutlet.layer.cornerRadius = connectBtnOutlet.bounds.height/2
        backBtnOutlet.layer.cornerRadius = 20
        RegisterNib()
        backgroundViewTbl.layer.cornerRadius = 20
        afterResultTblView.layer.cornerRadius = 20
        //afterResultTblView.backgroundColor = UIColor(red: 0.73, green: 0.73, blue: 0.88, alpha: 1.00)
       
    }
    
    
    //MARK: ConfigureViews
    
    func RegisterNib(){
        
       // self.afterResultTblView.backgroundColor = UIColor(red: 0.73, green: 0.73, blue: 0.88, alpha: 1.00)
        afterResultTblView.dataSource = self
        afterResultTblView.delegate = self
        afterResultTblView.separatorStyle = .none
        afterResultTblView.register(UINib(nibName: "ShowDiseaseTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowDiseaseTableViewCell")
    }
    
    
    //MARK: IBActions
    
    @IBAction func connectDoctorAction(_ sender: Any) {
        print("Connect To An Expert")
        let CommonVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "doctor") as? ExpertViewController
        self.navigationController?.pushViewController(CommonVC!, animated: true)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        //self.navigationController?.popToRootViewController(animated: true)
        
        if let navigationController = self.navigationController {

            // Specify the view controller class you want to pop to
            if let viewControllerToPopTo = navigationController.viewControllers.first(where: { $0 is CarouselViewController }) {

                // Pop to the specified view controller
                navigationController.popToViewController(viewControllerToPopTo, animated: true)
            }
        }
    }
}


extension AfterResultQuestionViewController: UITableViewDelegate, UITableViewDataSource{
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShowDiseaseTableViewCell", for: indexPath) as? ShowDiseaseTableViewCell else{
            return UITableViewCell()
        }
        cell.lblOutlet.text = arrOfResult[indexPath.row]
        cell.selectionStyle = .none
       // cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


