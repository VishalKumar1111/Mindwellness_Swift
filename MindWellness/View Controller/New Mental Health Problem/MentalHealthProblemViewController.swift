//
//  MentalHealthProblemViewController.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 09/12/22.
//

import UIKit

class MentalHealthProblemViewController: UIViewController{
    
    var arrcontentsName = ["Depression","Anxiety","Addiction","Psychosis","Bipolar Disorder","Other Psychotic "]
    var arrImage = ["two.jpg","anxiety.jpg","Addiction.png","phycosis.jpg","bipolardisorder.jpg", "otherpsychotic.jpeg"]
    var arrbgImageColours = ["bg6.jpeg","bg.png","bg5.jpeg","bg6.jpeg","bg4.jpeg","bg5.jpeg"]
    var arrDesc = ["Mood disorder that causes a persistent feeling of sadness and loss of interest","Anxiety is a feeling of fear, dread, and uneasiness.","Not having control over doing, taking or using something","A mental disorder characterised by a disconnection from reality.","Extreme mood swings"," Serious illnesses that affect the mind"]
    
    
    var arrPlistData = NSArray()
    var BtnName = String()
    var arrForSendDataToMentalHealthVC = [String]()
    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var MHPtableview: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var viewBackground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
            self.viewBackground.insertSubview(imageView, at: 0)
//            self.MHPtableview.insertSubview(imageView, at: 0)
//            self.headerview.insertSubview(imageView, at: 0)
        }
        
//        self.viewBackground.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
//        self.MHPtableview.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
//        self.headerview.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        MHPtableview.delegate = self
        MHPtableview.dataSource = self
        
       MHPtableview.register(UINib(nibName:"MentalHealthTableViewCell", bundle: nil), forCellReuseIdentifier: "MentalHealthTableViewCell")
        }

    @IBAction func backbtn(_ sender: Any) {
    
        self.navigationController?.popViewController(animated: true)
    }
    func Plist(Name: String){
        if let path = Bundle.main.path(forResource: Name, ofType: "plist") {
        arrPlistData = NSArray(contentsOfFile: path)!
        print(arrPlistData as Any)
    }
        if arrPlistData.count == 0{
        let alert = UIAlertController(title: "Data Not Found", message: "We Are Working On This. Sorry For Your Inconvenience", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
        
    }
}


extension MentalHealthProblemViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrcontentsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "MentalHealthTableViewCell", for: indexPath) as? MentalHealthTableViewCell)!
        cell.selectionStyle = .none
        cell.cellDesc.text = arrDesc[indexPath.row]
        let imgForCell = arrImage[indexPath.row]
        cell.cellImage.image = UIImage(named: imgForCell)
        cell.cellHeading.text = arrcontentsName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let MHPVC = storyboard?.instantiateViewController(withIdentifier: "MeditationViewController") as? MeditationViewController
//      MentalHealthViewController
    
        if indexPath.row == 0{
            BtnName = "Depression"
            Plist(Name: BtnName)
            let arrDepression = ["Depression ki dawao ka depression hota haii?","Side effect of anti depressant","Kya depression genetically hota hai","Depression ke patient ki lifestyle kaise honi chahiye"," how family can help depression","Three indications for cure of depression ","Brain changes in patients of Depression ","depression counselling se theek hota hai?","Why depression is increasing in Society?"," Depression ka ilaaj Kab tak chalega ?","Kaise Pata Chalega Depression Hai Ya Nahi", "Why one get Depression"]
            var arrProblems = ["What is Depression","Discuss Your Depression","Manage Your Depression In WorkPlace","Strategies","therapy"]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.arrVideoTopicHeading = arrDepression
            MHPVC?.CheckSourceOFData = "MHPVC"
        }else if indexPath.row == 1{
            
            print(indexPath)
            
            BtnName = "Anxiety"
            Plist(Name: BtnName)
            let arrAnxiety = ["Three Minute Exercise for Anxiety Relief","Handling Anxiety","ANXIETY DUE TO CORONA"]
            
            var arrProblems = ["Anxiety ","Connection B/w Anxiety And Eating Disorders","Discuss Anxiety With Your Doctors","Exercise'S In Managing Anxiety","How To Control Anxiety","Maintain healthy connection anxiety","Manage social anxiety","Managing anxiety and disorder","Understand Anxiety Disorder"]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrAnxiety
        }else if indexPath.row == 2{
            BtnName = "Addiction"
            Plist(Name: BtnName)
            var arrProblems = ["Addiction and mental health","Addiction stretegies","Enviromental effect on addiction","Overcome and unsderstand addiction","Support addicted loved one"]
            let arrAddiction = ["What is addiction","Internet Addiction kya hai ?","Addiction kya hai aur kaise theek hoga?"]
            
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrAddiction
            

        }
        else if indexPath.row == 3{
            BtnName = "Psychosis"
            Plist(Name: BtnName)
            var arrProblems = ["Connection B/w Schizophrenia & Substance Abuse","Misconceptions Related To Stigma And Psychosis","Coping Strategies & Support Resources","Connection B/w Psychpsis And Trauma ","Understanding Schizophrenia"]
            
            let arrpsychosis = ["Psyhychosis (schizophrenia) theek ho sakti hai? ","What is Shizophrenia (psychosis)"]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrpsychosis
        }else if indexPath.row == 4{
            BtnName = "Bipolar Disorder"
            Plist(Name: BtnName)
            let arrBipolar = ["Bipolar disorder kya hai ?"]
            
            var arrProblems = ["MANAGING BIPOLAR AFFECTIVE DISORDER   ","Medication and therapies for Bipolar disorder ","Relationships with Bipolar Disorder ","STIGMA'S PART IN BIPOLAR DISORDER  "]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrBipolar
        }else if indexPath.row == 5{
            BtnName = "Other Psychotic"
           // Plist(Name: BtnName)
            var arrProblems = ["Children behaviour and emotional disorder" ,"Linkage to truma Behiour emotional disorder", "Mindfull benifits to behaviour and disorder","Therapy for behaviour disorder"]
            
            let arrOthers = ["Sucide Prevention","Gussa kaise control hoga?","Migraine kaise theek hoga"]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrOthers
        }
        self.navigationController?.pushViewController(MHPVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
     
}
