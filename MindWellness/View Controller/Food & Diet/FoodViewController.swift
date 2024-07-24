//
//  FoodViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 06/10/23.
//

import UIKit

class FoodViewController: UIViewController {
//
//    @IBOutlet weak var lblName: UILabel!
//    @IBOutlet weak var lblDesc: UILabel!
    
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var lblDesc: UITextView!
    @IBOutlet weak var lblName: UILabel!
    
    var count = 0
    var arrdata = [[String:Any]]()
    
    var arrFood = [["name":"omega_3_fatty_acids_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"omega_3_fatty_acids_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named:"omega_3" )],
                   
        ["name":"complex_carbohydrates_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"complex_carbohydrates_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "carbohydrates")],
                   
        ["name":"protein_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"protein_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "protien")],
                   
        ["name":"antioxidant_rich_foods_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"antioxidant_rich_foods_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "antioxidant")],
                   
        ["name":"vitamin_d_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"vitamin_d_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "vitamind")],
                   
        ["name":"dark_chocolate_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"dark_chocolate_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "chocolate")],
                   
        ["name":"nuts_and_seeds_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") ,"desc":"nuts_and_seeds_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "seeds")],
                   
                   
        ["name":"whole_grains_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"whole_grains_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "grains")],
                   
        ["name":"eggs_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"eggs_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "egg")],
        
        ["name":"probiotics_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"probiotics_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "probiotic")],
                   
        ["name":"limit_processed_meats_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"limit_processed_meats_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "Meat")],
                   
        ["name":"practice_mindful_eating_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"practice_mindful_eating_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "mindful")],
                   
        ["name":"plan_meals_and_snacks_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"plan_meals_and_snacks_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "meal")]]
    
    
    var arrTips = [["name":"slow_down_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"slow_down_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "slow down")],
                   
        ["name":"choose_whole_grain_bread_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"choose_whole_grain_bread_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "bread")],
                   
        ["name":"add_greek_yogurt_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"add_greek_yogurt_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "yogurt")],
                   
        ["name":"eat_eggs_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"eat_eggs_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "eggs")],
                   
        ["name":"limit_sugar_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"limit_sugar_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "sugar")],
                   
        ["name":"moderate_caffeine_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"moderate_caffeine_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "alcohol")],
                   
        ["name":"increase_protein_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"increase_protein_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "proteins")],
                   
        ["name":"drink_enough_water_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"drink_enough_water_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "water")],
                   
        ["name":"bake_or_roast_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"bake_or_roast_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "baking")],
                   
                   
        ["name":"take_omega_3_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"take_omega_3_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "suppliments")],
                   
                   
        ["name":"replace_fast_food_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"replace_fast_food_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "avoid")],
                   
        ["name":"choose_baked_potatoes_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"choose_baked_potatoes_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "baked-potato")],
                   
        ["name":"stay_social_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"stay_social_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "social")],
                   
        ["name":"seek_professional_help_name".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"desc":"seek_professional_help_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "professional")]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = "FOOD & TIPS".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        arrdata=arrFood
        lblName.text = arrFood[0]["name"] as? String
        lblDesc.text = arrFood[0]["desc"] as? String
        imgFood.image = arrFood[0]["image"] as? UIImage
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right

            self.view.addGestureRecognizer(swipeRight)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeDown.direction = .left

            self.view.addGestureRecognizer(swipeDown)
    }
     
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
  
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
                
            switch swipeGesture.direction {
            case .right:
               
                if count >= 1  {
                    count -= 1
                
                    lblName.text = arrdata[count]["name"]  as? String
                    lblDesc.text = arrdata[count]["desc"]  as? String
                    imgFood.image = arrdata[count]["image"] as? UIImage
                    
                }else{

                    print("less tha zero or equal to zero")
                }
            case .left:
                if count < arrdata.count  {
                    count += 1
                  
                    lblName.text = arrdata[count-1]["name"] as? String
                    lblDesc.text = arrdata[count-1]["desc"] as? String
                    imgFood.image = arrdata[count-1]["image"] as? UIImage
                }
                else {

                    print("greater than zero")
                }
        
            default:
                break
            }
        }
    }
    

    @IBAction func btnBack(_ sender: Any) {
        print("Button Clicked")
//        let vc = storyboard?.instantiateViewController(withIdentifier: "CarouselViewController") as? CarouselViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        self.navigationController?.popViewController(animated: true) 
        
    }
    
    
    @IBAction func btnSegment(_ sender: Any) {
        
        if segment.selectedSegmentIndex == 0 {
            count = 0
            arrdata = arrFood
            
            imgFood.image = arrdata[0]["image"] as? UIImage

            lblName.text = arrdata[0]["name"] as? String

            lblDesc.text = arrdata[0]["desc"] as? String

            
        }
        if segment.selectedSegmentIndex == 1 {
            count = 0
         
            arrdata = arrTips

            imgFood.image = arrdata[count]["image"] as? UIImage
            lblName.text = arrdata[count]["name"] as? String
            lblDesc.text = arrdata[count]["desc"] as? String
            
        }
    
        
    }
//    
//    func startTimer() {
//            // Create a new timer that fires every 1 second (adjust as needed)
//            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//        }
    
    
    

}
