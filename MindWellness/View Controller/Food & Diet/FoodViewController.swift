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
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var lblDesc: UITextView!
    @IBOutlet weak var lblName: UILabel!
    
    var count = 0
    var arrdata = [[String:Any]]()
    
    var arrFood = [["name":"Omega-3 Fatty Acids","desc":"Incorporate foods rich in omega-3 fatty acids, such as salmon, trout, walnuts, and flaxseeds. These fats are important for brain health and can help reduce symptoms of depression and anxiety.","image":UIImage(named:"omega_3" )],["name":"Complex Carbohydrates","desc":"Choose complex carbohydrates like whole grains (brown rice, quinoa, whole wheat bread) over refined carbohydrates (white bread, sugary cereals). Complex carbs provide a steady source of energy and can help stabilize mood.","image":UIImage(named: "carbohydrates")],["name":"Protein","desc":"Include lean sources of protein like chicken, turkey, fish, tofu, beans, and legumes. Protein contains amino acids that are important for the production of neurotransmitters like serotonin, which can influence mood.","image":UIImage(named: "protien")],["name":"Antioxidant-Rich Foods","desc":"Eat foods high in antioxidants, such as berries, leafy greens, and colorful fruits and vegetables. Antioxidants can protect the brain from oxidative stress and inflammation.","image":UIImage(named: "antioxidant")],["name":"Vitamin D","desc":"If you have limited sun exposure, consider taking a vitamin D supplement or consuming vitamin D-fortified foods. Low levels of vitamin D have been linked to depression.","image":UIImage(named: "vitamind")],["name":"Dark Chocolate","desc":"Dark chocolate with a high percentage of cocoa is a delicious treat that also offers brain-boosting benefits. It contains flavonoids and antioxidants that improve blood flow to the brain, enhance cognitive function, and boost mood. Enjoy a small piece of dark chocolate as a guilt-free indulgence for your brain.","image":UIImage(named: "chocolate")],["name":"Nuts and Seeds" ,"desc":"Nuts and seeds, such as walnuts, almonds, and flaxseeds, are packed with healthy fats, vitamins, and minerals that support brain health. They are rich in omega-3 fatty acids and antioxidants that improve cognitive function and protect against age-related cognitive decline. Snack on a handful of nuts and seeds to keep your brain sharp.","image":UIImage(named: "seeds")],["name":"Whole Grains","desc":"Whole grains, such as quinoa, brown rice, and oats, provide a steady release of glucose, the brain's main source of energy. They are rich in fiber, vitamins, and minerals that support brain health and improve cognitive function. Incorporate whole grains into your meals for sustained brain power.","image":UIImage(named: "grains")],["name":"Eggs","desc":"Eggs are a nutrient-packed food that provides choline, an essential nutrient for brain health. Choline is a precursor to acetylcholine, a neurotransmitter involved in memory and learning. Eggs also contain vitamin B12 and folate, which support brain function. Include eggs in your diet to nourish your brain.","image":UIImage(named: "egg")],["name":"Probiotics","desc":"Gut health is increasingly linked to mental health. Incorporate foods with probiotics like yogurt or consider a probiotic supplement to support a healthy gut microbiome.","image":UIImage(named: "probiotic")],["name":"Limit Processed Meats","desc":" High consumption of processed meats like bacon and sausages has been associated with an increased risk of depression. Opt for leaner protein sources instead.","image":UIImage(named: "Meat")],["name":"Practice Mindful Eating","desc":"Pay attention to your hunger and fullness cues. Eating mindfully can help you avoid overeating and emotional eating.","image":UIImage(named: "mindful")],["name":"Plan Meals and Snacks","desc":"Having a regular eating schedule can help stabilize blood sugar levels and prevent mood swings.","image":UIImage(named: "meal")]]
    
    
    var arrTips = [["name":"Slow down","desc":"The pace at which you eat influences how much you eat, as well as how likely you are to gain weight. In fact, studies comparing different eating speeds show that fast eaters are much more likely to eat more and have a higher body mass index (BMI) than slow eaters Your appetite, how much you eat, and how full you get are all controlled by hormones. Hormones signal to your brain whether you’re hungry or full","image":UIImage(named: "slow down")],["name":"Choose whole grain bread instead of refined","desc":"You can easily make your diet a bit healthier by choosing whole grain bread in place of traditional refined grain bread. Refined grains have been associated with many health issues. Whole grains, on the other hand, have been linked to a variety of health benefits, including a reduced risk of type 2 diabetes, heart disease, and cancer\n   They’re also a good source of:\n * fiber\n  * B vitamins\n * minerals such as zinc, iron, magnesium, and manganese.","image":UIImage(named: "bread")],["name":"Add Greek yogurt to your diet","desc":"Greek yogurt (or Greek-style yogurt) is thicker and creamier than regular yogurt.\n It has been strained to remove its excess whey, which is the watery part of milk. This results in a final product that’s higher in fat and protein than regular yogurt.\n In fact, it contains up to twice as much protein as the same amount of regular yogurt does, or up to 10 grams per 3.5 ounces","image":UIImage(named: "yogurt")],["name":"Eat eggs, preferably for breakfast","desc":"Eggs are incredibly healthy, especially if you eat them in the morning.\n They are rich in high quality protein and many essential nutrients that people often don’t get enough of, such as choline.\n   When looking at studies comparing various types of calorie-matched breakfasts, eggs come out on top.","image":UIImage(named: "eggs")],["name":"Limit Sugar and Processed Foods","desc":"Excess sugar and highly processed foods can lead to energy spikes and crashes, affecting mood and energy levels. Opt for whole, unprocessed foods whenever possible.","image":UIImage(named: "sugar")],["name":"Moderate Caffeine and Alcohol","desc":"While small amounts of caffeine and alcohol may be okay for some people, excessive consumption can disrupt sleep and worsen anxiety and depression symptoms. Be mindful of your intake.","image":UIImage(named: "alcohol")],["name":"Increase your protein intake","desc":"Protein is often referred to as the king of nutrients, and it does seem to have some superpowers.\nDue to its ability to affect your hunger and satiety hormones, it’s often considered the most filling of the macronutrients .\n  One study showed that eating a high-protein meal decreased levels of gherkin, the hunger hormone, more than a high-carb meal in people with obesity.\n Good sources of protein include:\n    * dairy products\n  * nuts\n  * peanut butter\n * eggs\n  * beans\n  * lean meat","image":UIImage(named: "proteins")],["name":"Drink enough water","desc":"Drinking enough water is important for your health.\nMany studies have shown that drinking water can increase weight loss and promote weight maintenance, and it may even slightly increase the number of calories you burn each day.\n  Studies also show that drinking water before meals can reduce your appetite and food intake during the following meal\n That said, the most important thing is to drink water instead of other beverages. This may drastically reduce your intake of sugar and calories","image":UIImage(named: "water")],["name":"Bake or roast instead of grilling or frying","desc":"The way you prepare your food can drastically change its effects on your health.\nGrilling, broiling, frying, and deep-frying are all popular methods of preparing meat and fish\nHowever, during these types of cooking methods, several potentially toxic compounds are formed. These include : \n * polycyclic aromatic hydrocarbons \n * advanced glycation end products \n* heterocyclic amines \nHealthier cooking methods include:\n baking \n broiling \n poaching \n pressure cooking \n    simmering \n slow cooking   \n stewing \n sous-vide","image":UIImage(named: "baking")],["name":"Take omega-3 and vitamin D supplements","desc":"Approximately 1 billion people around the globe are deficient .\nVitamin D is a fat-soluble vitamin that’s very important for bone health and the proper functioning of your immune system. In fact, every cell in your body has a receptor for vitamin D, indicating its importance.\nVitamin D is found in very few foods, but fatty seafood generally contains the highest amounts.\nOmega-3 fatty acids are another commonly lacking nutrient that’s found in fatty seafood. These have many important roles in the body, including reducing inflammation, maintaining heart health, and promoting proper brain function .","image":UIImage(named: "suppliments")],["name":"Replace your favorite fast food restaurant","desc":"Eating out doesn’t have to involve unhealthy foods.       Consider upgrading your favorite fast food restaurant to one with healthier options.There are many healthy fast food restaurants and fusion kitchens offering healthy and delicious meals.","image":UIImage(named: "avoid")],["name":"Choose baked potatoes over french fries","desc":"Potatoes are very filling and a common side to many dishes.That said, the method in which they’re prepared largely determines their impact on health.\nFor starters, 3.5 ounces (100 grams) of baked potatoes contain 93 calories,while the same amount of french fries contains over 3 times as many (333 calories).\nFurthermore, deep-fried french fries generally contain harmful compounds such as aldehydes and trans fats .","image":UIImage(named: "baked-potato")],["name":"Stay Social","desc":"Eating with friends and family can have positive effects on mental health. Social interaction and sharing meals can provide emotional support and reduce feelings of isolation.","image":UIImage(named: "social")],["name":"Seek Professional Help","desc":"If you have specific dietary concerns related to mental health conditions, consider consulting with a registered dietitian or mental health professional for personalized guidance.","image":UIImage(named: "professional")]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
