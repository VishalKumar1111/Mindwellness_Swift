//
//  MentalHealthProblemViewController.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 09/12/22.
//

import UIKit

class MentalHealthProblemViewController: UIViewController{
    
    @IBOutlet weak var lblTitle: UILabel!
    var arrcontentsName = ["Depression".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Addiction".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Psychosis".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Bipolar Disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Other Psychotic".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
    var arrImage = ["two.jpg","anxiety.jpg","Addiction.png","phycosis.jpg","bipolardisorder.jpg", "otherpsychotic.jpeg"]
    var arrbgImageColours = ["bg6.jpeg","bg.png","bg5.jpeg","bg6.jpeg","bg4.jpeg","bg5.jpeg"]
    var arrDesc = ["Mood disorder that causes a persistent feeling of sadness and loss of interest".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Anxiety is a feeling of fear, dread, and uneasiness.".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Not having control over doing, taking or using something".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"A mental disorder characterised by a disconnection from reality.".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Extreme mood swings".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Serious illnesses that affect the mind".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
    
    
    var arrPlistData = NSArray()
    var BtnName = String()
    var arrForSendDataToMentalHealthVC = [String]()
    @IBOutlet weak var headerview: UIView!
    @IBOutlet weak var MHPtableview: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var viewBackground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "Mental Health Problems".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
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
            
            
            let arrDepression = ["Depression ki dawao ka depression hota haii".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Side effect of anti depressant".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
                ,"Kya depression genetically hota hai".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                "Depression ke patient ki lifestyle kaise honi chahiye".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                                 "Aap depression ke patient ki kaise help kar sakte hain/ how family can help depression".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
                                 ,"Teen Cheezin Jo Batati Hain Depression Theek hoga".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Brain changes in patients of Depression".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Depression counselling se theek hota hai".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Why depression is increasing in Society ?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Depression ka ilaaj Kab tak chalega ?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Kaise Pata Chalega Depression Hai Ya Nahi".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Why one get Depression".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            
//
//            let arrDepression = ["Depression ki dawao ka depression hota haii?","Side effect of anti depressant","Kya depression genetically hota hai","Depression ke patient ki lifestyle kaise honi chahiye"," how family can help depression","Three indications for cure of depression ","Brain changes in patients of Depression ","depression counselling se theek hota hai?","Why depression is increasing in Society?"," Depression ka ilaaj Kab tak chalega ?","Kaise Pata Chalega Depression Hai Ya Nahi", "Why one get Depression"]
            var arrProblems = ["What is Depression".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Discuss Your Depression".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Manage Your Depression In WorkPlace".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Strategies".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"therapy".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.arrVideoTopicHeading = arrDepression
            MHPVC?.CheckSourceOFData = "MHPVC"
        }else if indexPath.row == 1{
            
            print(indexPath)
            
            BtnName = "Anxiety"
            Plist(Name: BtnName)
            let arrAnxiety = ["Three Minute Exercise for Anxiety Relief".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Handling Anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"ANXIETY DUE TO CORONA".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            
            var arrProblems = ["Anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Connection B/w Anxiety And Eating Disorders".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Discuss Anxiety With Your Doctors".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Exercise'S In Managing Anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"How To Control Anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Maintain healthy connection anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Manage social anxiety".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Managing anxiety and disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Understand Anxiety Disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrAnxiety
        }else if indexPath.row == 2{
            BtnName = "Addiction"
            Plist(Name: BtnName)
            var arrProblems = ["Addiction and mental health".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Addiction stretegies".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Enviromental effect on addiction".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Overcome and unsderstand addiction".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Support addicted loved one".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            let arrAddiction = ["What is addiction".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Internet Addiction kya hai ?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Addiction kya hai aur kaise theek hoga?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrAddiction
            

        }
        else if indexPath.row == 3{
            BtnName = "Psychosis"
            Plist(Name: BtnName)
            var arrProblems = ["Connection B/w Schizophrenia & Substance Abuse".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Misconceptions Related To Stigma And Psychosis".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Coping Strategies & Support Resources".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Connection B/w Psychosis And Trauma".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Understanding Schizophrenia".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            
            let arrpsychosis = ["Psychosis (schizophrenia) theek ho sakti hai?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"What is Shizophrenia (psychosis)".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrpsychosis
        }else if indexPath.row == 4{
            BtnName = "Bipolar Disorder"
            Plist(Name: BtnName)
            let arrBipolar = ["Bipolar disorder kya hai ?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            
            var arrProblems = ["MANAGING BIPOLAR AFFECTIVE DISORDER".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Medication and therapies for Bipolar disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Relationships with Bipolar Disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"STIGMA'S PART IN BIPOLAR DISORDER".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            MHPVC?.HeadingLblNameOfView = BtnName
//            MHPVC?.arrOfDataFromMHPVC = arrPlistData
            MHPVC?.arrOfProblemTopicHeading = arrProblems
            MHPVC?.CheckSourceOFData = "MHPVC"
            MHPVC?.arrVideoTopicHeading = arrBipolar
        }else if indexPath.row == 5{
            BtnName = "Other Psychotic"
           // Plist(Name: BtnName)
            var arrProblems = ["Children behaviour and emotional disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") ,"Linkage to truma Behiour emotional disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""), "Mindfull benifits to behaviour and disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Therapy for behaviour disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
            
            let arrOthers = ["Sucide Prevention".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Gussa kaise control hoga?".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"Migraine kaise theek hoga".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]
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
