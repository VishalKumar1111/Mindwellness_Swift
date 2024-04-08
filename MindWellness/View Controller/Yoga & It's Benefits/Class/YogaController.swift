//
//  YogaController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 14/12/23.
//

import UIKit
import WebKit

class YogaController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,WKUIDelegate,WKNavigationDelegate {
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var wkwebview: WKWebView!
    
    @IBOutlet weak var collectionVideo: UICollectionView!
    @IBOutlet weak var collectionYogaBlog: UICollectionView!
    var arrYogaVideo = [["title":"Depression mein kaun se yoga karne chahiye","url":"https://www.youtube.com/watch?v=VtDEgWQ5coA","image":UIImage(named: "Depression_yoga")],["title":"How yoga improves mental health","url":"https://www.youtube.com/watch?v=9ujiz0G5a1E","image":UIImage(named: "mental_yoga")]]
    
    var arrYogadata = [["title":"Paschimottanasana","image":UIImage(named: "Paschimottanasana"),"desc":"Paschimottanasana commonly known as Seated Forward Bend or Intense Dorsal Stretch, is a yoga pose that involves a forward fold while seated. It is a fundamental asana and is often included in various yoga practices, including Hatha, Ashtanga, and Vinyasa yoga. Here's a step-by-step guide on how to practice Paschimottanasana:\n\nHow to Practice Paschimottanasana (Seated Forward Bend):\n\n1.    Starting Position (Dandasana):\n  •    Begin by sitting on the yoga mat with your legs extended straight in front of you.\n  • Ensure that your spine is erect, and your feet are flexed with toes pointing towards the ceiling.\n\n 2.    Hand Placement:\n\n  •    Place your palms on the mat beside your hips, fingers pointing forward.\n\n  •    Engage your quadriceps and press your thighs into the mat.\n\n  3.    Inhale and Lengthen:\n\n  •    Inhale and lengthen your spine, lifting your chest towards the ceiling.\n\n  •    Roll your shoulders back and down, opening the chest.\n\n\n   4.    Exhale and Fold Forward:\n •    Exhale as you hinge at your hips and begin to fold forward from the pelvis.\n •    Keep your spine long and lead with your chest, not your head.\n  5. Reach Toward Your Toes:\n  •Extend your arms forward, reaching for your feet.\n • If possible, hold onto your feet with your hands. Alternatively, you can hold onto your shins or use a yoga strap around your feet for assistance.\n  6.    Keep Your Back Straight:\n\n  • Focus on keeping your back straight rather than rounding it. Lengthen the spine with each breath. 7.    Gaze Direction:\n •    Keep your gaze directed forward or towards your toes, avoiding straining your neck.\n  8.  Breathing:\n  •    Breathe deeply and slowly in the pose. With each inhalation, lengthen your spine, and with each exhalation, deepen the forward fold.\n\n   9.    Hold the Pose:\n\n  • Hold the pose for 30 seconds to 1 minute, gradually increasing the duration as your flexibility improves.\n\n  10. Release:\n\n  • To come out of the pose, inhale and lift your torso back up, reversing the movement.\n   • Release your arms and relax in a seated position.\n Benefits of Paschimottanasana:\n\n  • Stretches the entire length of the spine, promoting flexibility.\n\n  • Targets and stretches the hamstrings, calves, and thighs.\n\n   • Stimulates the abdominal organs, aiding digestion.\n\n  • Calms the mind and helps relieve stress and mild depression.\n\n  • Therapeutic for high blood pressure and insomnia.\n\n • Improves posture by strengthening the back muscles.\n\n Contraindications and Precautions:\n\n • Individuals with lower back issues or sciatica should practice with caution and may use props for support.    •    Pregnant women should avoid deep forward bends in the later stages of pregnancy.\n\n •    People with hamstring injuries or tightness may need to modify the pose or use props.    As with any yoga pose, listen to your body, avoid pushing yourself into discomfort or pain, and practice with mindfulness. If you have specific health concerns or conditions, it's advisable to consult with a healthcare professional or a certified yoga instructor before attempting  Paschimottanasana"],["title":"Bhujangasana","image":UIImage(named: "Bhujangasana"),"desc":"Bhujangasana, also known as Cobra Pose, is a yoga asana that involves arching the back while keeping the lower body and pelvis on the mat. This pose is part of the Surya Namaskar (Sun Salutation) sequence and is commonly practiced in Hatha and Vinyasa yoga. Here is a step-by-step guide on how to perform Bhujangasana:\n\n How to Practice Bhujangasana (Cobra Pose):  1.    Starting Position (Prone Position):\n\n •    Begin by lying on your stomach (prone position) on a yoga mat.\n\n  •    Stretch your legs back, with the tops of your feet resting on the mat. 2.    Placement of Hands:\n\n  • Place your palms on the mat, directly under your shoulders.\n\n • Your fingers should be pointing forward, and your elbows should be close to your body. 3.    Position of Legs:\n\n • Keep your feet together, or you can have them slightly apart.\n\n • The tops of your feet should be pressing into the mat.\n\n 4. Engage Core Muscles:\n\n •    Engage your core muscles by drawing your navel toward your spine.\n\n •    Keep your buttocks firm but not overly tense.\n\n 5. Inhale and Lift:\n\n • Inhale as you slowly lift your chest off the mat.\n\n •    Use your back muscles to lift, rather than pushing with your hands.\n\n 6. Elbows Slightly Bent:\n\n  • Keep your elbows slightly bent, avoiding hyperextension.\n\n  •    Ensure that your shoulders are away from your ears.\n\n 7. Gaze Forward:\n\n  • Lift your head and gaze forward, extending your neck while keeping it in line with your spine.\n\n • Avoid straining your neck by keeping a natural curve.\n\n 8.    Open Chest:\n\n • Open your chest by rolling your shoulders back and down.\n\n • Lift through the sternum to create a gentle backbend.\n\n 9. Breathing:    •    Breathe deeply and comfortably in the pose.\n\n •    Feel the expansion of the chest and the stretch in the front of the body.\n\n 10. Hold the Pose:\n\n • Hold the pose for 15-30 seconds initially, gradually increasing the duration as you become more comfortable.\n\n • Focus on maintaining a steady breath and gentle engagement of the muscles.\n\n 11.Release the Pose: •    Exhale as you gently lower your chest back down to the mat.\n\n •Rest your forehead on the mat and relax your arms alongside your body.\n\n Benefits of Bhujangasana:\n\n •    Strengthens the muscles of the back, especially the lower spine.\n\n •    Stretches the front of the body, including the abdomen, chest, and shoulders.\n\n • Improves flexibility in the spine. •    Helps relieve stiffness in the lower back.\n\n •Stimulates abdominal organs, aiding digestion.\n\n • Can be therapeutic for mild sciatica.\n\n • Invigorates the mind and promotes a sense of openness and energy.\n\n Contraindications and Precautions:\n\n  • Individuals with back injuries, herniated discs, or recent abdominal surgery should avoid this pose.\n\n • Pregnant women should practice with caution, avoiding excessive pressure on the abdomen.\n\n  • If you have any medical concerns, consult with a healthcare professional or a certified yoga instructor before attempting Bhujangasana.\n\n  Always listen to your body, avoid overexertion, and modify the pose as needed based on your individual flexibility and comfort level."],["title":"Surya Namaskar" , "image":UIImage(named: "Surya Namaskar"),"desc":"Surya Namaskar, also known as Sun Salutation, is a traditional sequence of yoga poses performed in a flowing and rhythmic manner. This practice is an integral part of many yoga traditions and is commonly used as a warm-up or full-body exercise. Surya means the sun, and Namaskar means salutation or greeting. The practice is named as such because it is a series of postures that express gratitude and reverence to the sun, which is considered a symbol of life and energy in many cultures.\n\n Here's a basic description of the traditional Surya Namaskar sequence:\n\n 1. Pranamasana (Prayer Pose):\n\n  • Stand at the front of your mat with your feet together.\n\n • Bring your palms together in a prayer position at your chest.\n\n • Take a moment to center yourself and set an intention for your practice.\n\n 2. Hasta Uttanasana (Raised Arms Pose):\n\n  • Inhale and lift your arms overhead, arching backward slightly.  •    Keep your biceps close to your ears, lengthening your spine.\n\n 3. Hasta Padasana (Hand to Foot Pose):\n\n • Exhale and bend forward at the hips, bringing your hands to the floor beside your feet.\n\n • Keep your spine straight, and if needed, bend your knees slightly.\n\n 4. Ashwa Sanchalanasana (Equestrian Pose):\n\n •  Inhale and step your right leg back into a lunge position.\n\n  •    Keep your left knee bent and lift your chest, looking forward.\n\n 5. Dandasana (Stick Pose):\n\n • Inhale and step your left leg back to bring your body into a straight line, like a plank.\nb\n  •    Keep your arms perpendicular to the floor.\n\n 6. Ashtanga Namaskara (Eight-Limbed Salutation):\n\n  •    Lower your knees, chest, and chin to the floor, keeping your hips lifted. •    Your eight body parts touching the ground are your two hands, two feet, two knees, chest, and chin.\n\n 7. Bhujangasana (Cobra Pose):\n\n • Inhale and lift your chest into a gentle backbend, keeping your hands on the floor.\n\n  •    Use your back muscles to lift your upper body.\n\n  8.    Adho Mukha Svanasana (Downward-Facing Dog Pose):\n\n  •    Exhale and lift your hips towards the ceiling, straightening your legs.\n\n •    Your body should form an inverted V shape.\n\n 9. Ashwa Sanchalanasana (Equestrian Pose):\n\n •    Inhale and step your right foot forward into a lunge position, similar to step 4.\n\n 10.    Hasta Padasana (Hand to Foot Pose):\n\n •    Exhale and bring your left foot forward to meet your right foot, returning to the forward bend. 11.    Hasta Uttanasana (Raised Arms Pose):\n\n •    Inhale, raise your arms overhead, and arch backward slightly.\n\n 12.    Pranamasana (Prayer Pose):\n\n •    Exhale and return to the prayer position, palms together at your chest.\n\n Benefits of Surya Namaskar:\n\n  • Physical Fitness: Surya Namaskar is a complete workout for the body, engaging various muscle groups and improving flexibility.\n\n • Cardiovascular Health: The sequence enhances blood circulation, promoting a healthy heart.\n\n  • Mental Clarity: The synchronized breath and movement promote mental focus and concentration.\n\n   •    Stress Reduction: The practice is known for its calming effect on the nervous system, reducing stress and anxiety.•    Spiritual Connection: Surya Namaskar is often seen as a holistic practice that connects the practitioner with the energy of the sun and promotes a sense of gratitude and well-being.Precautions:\n\n  •    If you have any health concerns or injuries, consult with a healthcare professional or a qualified yoga instructor before practicing Surya Namaskar.\n\n • Practice at your own pace, and avoid overexertion.\n\n Surya Namaskar can be modified to suit various fitness levels, and regular practice can contribute to overall physical and mental well-being. "],["title":" Ustrasana" , "image":UIImage(named: "ustrasana"),"desc":"Ustrasana,commonly known as Camel Pose, is a yoga asana that involves a deep backward bend. This pose is known for its ability to open up the chest, stretch the front of the body, and increase flexibility in the spine. Here's a step-by-step guide on how to practice Ustrasana:\n\n How to Practice Ustrasana (Camel Pose):\n\n 1. Starting Position:\n\n •    Begin by kneeling on the yoga mat with your knees hip-width apart.\n\n  • Ensure that your thighs are perpendicular to the mat, and the tops of your feet are resting on the mat.\n\n 2. Hand Placement:•    Place your hands on your hips, with your fingers pointing downward and your thumbs resting on your sacrum (the flat, triangular bone at the base of your spine).\n\n 3. Inhale and Engage:• Inhale deeply, engaging your core muscles to lengthen your spine.\n\n 4. Arching Backward:\n\n • Begin to arch backward by pressing your hips forward.\n\n • Gradually reach your hands down to your heels, one at a time, keeping your chest lifted.\n\n 5. Thighs Vertical:\n\n • Keep your thighs vertical and perpendicular to the mat.\n\n • Avoid pushing your hips too far forward, maintaining a natural curve in your lower back.\n\n 6.  Opening the Chest:\n\n •    Open your chest and lift your sternum toward the ceiling.\n\n• Drop your head back if comfortable, but avoid straining your neck. Keep your gaze upward or toward the back wall.\n\n7.    Breathing:\n\n• Breathe deeply and evenly in the pose.\n\n •  Feel the expansion in your chest and the stretch along the front of your body.\n\n 8.     Hold the Pose:\n\n  • Hold Ustrasana for 15-30 seconds, or longer if comfortable.\n\n • Focus on the sensation of opening the heart and lengthening the spine. 9.    Return to Starting Position:\n\n • To come out of the pose, bring your hands back to your hips, lift your chest, and slowly return to an upright kneeling position.\n\n Variations:•    Hands on Heels: If reaching your heels is challenging, you can keep your hands on your lower back or place them on yoga blocks beside your feet.\n\n  Benefits of Ustrasana:•    Stretches and strengthens the entire front of the body.\n\n  •    Opens the chest and lungs, improving respiratory function.\n\n •    Stimulates the organs in the abdomen. •    Strengthens the back muscles.\n\n • Improves posture and flexibility in the spine.\n\n • Invigorates and energizes the body.\n\n Contraindications and Precautions:\n\n• Individuals with back or neck injuries should avoid or modify this pose.\n\n  •    People with high blood pressure or heart issues should practice with caution.\n\n • Pregnant women should be cautious and may choose to modify the pose by keeping hands on the lower back.\n\n As with any yoga pose, listen to your body, practice mindfully, and avoid pushing yourself into discomfort or pain. If you have specific health concerns or conditions, consider consulting with a healthcare professional or a certified yoga instructor before attempting Ustrasana."],["title":"Ardha Chakrasana" ,"image":UIImage(named: "Ardha-Chakrasana"),"desc": "Ardha Chakrasana also known as Half Wheel Pose or Standing Backbend, is a yoga pose that involves a gentle backward bend from a standing position. This pose helps in opening the chest, stretching the front of the body, and improving flexibility in the spine. Here's a step-by-step guide on how to practice Ardha Chakrasana:\n\nHow to Practice Ardha Chakrasana (Half Wheel Pose):\n\n1.    Starting Position:\n\n • Begin by standing tall with your feet hip-width apart.\n\n •    Ensure that your weight is evenly distributed on both feet.\n\n 2. Hand Placement:•Bring your hands to your lower back, placing your palms on your sacrum (the flat, triangular bone at the base of your spine).\n\n •  Your fingers should be pointing downward, and your elbows should be drawn close together.\n\n 3. Inhale and Open the Chest:\n\n • Inhale deeply, and as you do, lift your chest and sternum toward the ceiling.\n\n • Keep your shoulders relaxed and away from your ears.\n\n 4.    Arching Backward:\n\n •    Begin to arch backward by pressing your hips slightly forward.\n\n • Allow your head to drop back if comfortable, but avoid straining your neck. Keep your gaze either straight ahead or slightly upward.\n\n 5. Engage Your Legs:\n\n • Keep your legs active and engaged. Avoid locking your knees, and maintain a micro-bend in them.6.    Breathing:\n\n • Continue to breathe deeply and evenly. Feel the expansion in the chest and the stretch along the front of the body.\n\n 7. Hold the Pose:\n\n • Hold the pose for 15-30 seconds, or longer if comfortable.\n\n • Focus on the sensation of opening the chest and lengthening the spine.\n\n 8. Return to the Starting Position:\n\n • To come out of the pose, exhale and slowly return to the upright position.\n\n • Release your hands and stand with a neutral spine.\n\n Benefits of Ardha Chakrasana:\n\n • Stretches and opens the chest and lungs.\n\n •     Improves flexibility in the spine.\n\n • Strengthens the back muscles.\n\n • Stimulates the abdominal organs.\n\n • Helps in relieving mild backaches.\n\n   •    Energizes and invigorates the body.Contraindications and Precautions:\n\n•    Individuals with serious back issues or injuries should avoid or modify this pose.\n\n • If you have neck problems, keep the head in a neutral position and avoid dropping it back.\n\n  •    People with high blood pressure should be cautious and may choose a gentler backbend.\n\n • Pregnant women should practice with care, avoiding excessive pressure on the abdomen.\n\n  As with any yoga pose, it's essential to approach Ardha Chakrasana with mindfulness and respect for your body's limitations. If you have specific health concerns or conditions, consider consulting with a healthcare professional or a certified yoga instructor before attempting this pose."]]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionYogaBlog{
            return arrYogadata.count
            
        }else if collectionView == collectionVideo{
            return arrYogaVideo.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionYoga
        if collectionView == collectionYogaBlog{
            
            cell?.txtTitle.text = arrYogadata[indexPath.row]["title"] as! String
            cell?.imgYoga.image = arrYogadata[indexPath.row]["image"] as! UIImage
        }else if collectionView == collectionVideo{
            cell?.txtTitle.text = arrYogaVideo[indexPath.row]["title"] as? String
            cell?.imgYoga.image = arrYogaVideo[indexPath.row]["image"] as? UIImage
            
        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionYogaBlog{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "blogs") as? MentalBlogsViewController
            
                vc?.arrData = arrYogadata[indexPath.row]
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }else if collectionView == collectionVideo{
            let myURL = URL(string: arrYogaVideo[indexPath.row]["url"] as! String)
                let myRequest = URLRequest(url: myURL!)
                print(myRequest)
               
                wkwebview.load(myRequest)
                
                wkwebview.isHidden = false
                wkwebview.isHidden = true
//
//            let url = NSURL(string: "https://www.youtube.com/watch?v=VtDEgWQ5coA")!
//            UIApplication.shared.openURL(url as URL)
            
            
            
        }
    
        
        
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
        loader.isHidden = true
        collectionYogaBlog.register(UINib(nibName: "CollectionYoga", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionVideo.register(UINib(nibName: "CollectionYoga", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        wkwebview.uiDelegate = self
        wkwebview.navigationDelegate = self
        wkwebview.isHidden = true
        
        
        

        
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
           print("Start Request")
        //loader.startAnimating()
        loader.isHidden = false
       }
       
       func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
           print("Failed Request")
       }
       
       func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           print("Finished Request")
           loader.isHidden = true
       }

    
    
    
    

}
