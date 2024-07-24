//
//  MeditationViewController.swift
//  MindWellness
//
//  Created by HarshitSinha on 07/10/22.
//

import UIKit
import AVFAudio
import AVFoundation
import AVKit
import WebKit

class MeditationViewController: UIViewController{

    @IBOutlet weak var titleBackground: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var colectionView: UICollectionView!
    
    
   
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var myPlayer: WKWebView!
    
    
    
    @IBOutlet weak var txtTitle: UILabel!
    
    var CheckSourceOFData = ""
    var arrOfProblemTopicHeading = [String]()
    var arrVideoTopicHeading = [String]()
    var HeadingLblNameOfView = ""
    var tagCounter = 0
    
    
    var player: AVAudioPlayer?
//
//    let arrDepression = [
//            [
//                "title": "What Is Depression",
//                "image": UIImage(named: "professional"),
//                "desc": "CAUSES, SYMPTOMS, AND TREATMENT OPTIONS OF DEPRESSION\nAn overview of depression will be given in this blog post, along with information on the many types of depression, their causes, and the various possible treatments.\n\nMillions of individuals throughout the world suffer from depression, a prevalent mental health issue. Feelings of despair, hopelessness, and a lack of interest in once-enjoyable activities are its hallmarks. We'll talk about the numerous forms of depression, its causes, and the various possible treatments in this blog post.\n\nTypes of depression\n- The most prevalent kind of depression, known as major depressive disorder (MDD), is characterized by symptoms that last for at least two weeks.\n- Chronic, protracted depression that lasts for two years or longer is the hallmark of persistent depressive disorder (PDD).\n- Bipolar disorder is a mood condition marked by alternating episodes of mania and depression.\n- Seasonal Affective Disorder (SAD): During the winter, when there is less sunlight, this depression manifests itself.\n\nDepression causes include\n- Genetics: Depression may run in families and be inherited.\n- Depression may result from an imbalance of certain brain chemicals, such as serotonin and dopamine.\n- Environmental Factors: Traumatic occurrences, stressful life events, and the loss of a loved one can all lead to depression.\n- Medical Conditions: Depression can be brought on by a number of illnesses, including cancer, thyroid problems, and chronic pain.\n\nDepression symptoms:\n- Sad, powerless, and full of despair.\n- Loss of interest in once-enjoyable activities.\n- Changes in weight and appetite.\n- A problem is falling asleep or oversleeping.\n- Fatigue and energy decline.\n- Having trouble focusing and making decisions.\n- Feelings of remorse and worthlessness.\n- Ideas or impulses toward suicide.\n\nTreatment Alternatives \n - Therapy: Individuals with depression can benefit from therapy by altering unhelpful thought and behaviour patterns, such as those found in cognitive-behavioural therapy (CBT).\n- Medication: Antidepressant drugs can help the brain's chemical equilibrium and lessen depressive symptoms. \n- Exercise: Regular exercise might help elevate mood and lessen depressive symptoms.\n- Light Therapy: People who are suffering from SAD are exposed to strong light for a set period of time each day as part of a light therapy regimen.\n- Self-Care: Taking care of oneself by getting enough rest, eating a portion of healthy food, and relaxing might help reduce the symptoms of depression. \n\nConclusion\nIn conclusion, therapy, medication, exercise, and self-care can all be used to treat depression, a prevalent mental health problem. If you or someone you love is exhibiting signs of depression, it's critical to get treatment. People who suffer from depression can live happy, healthy lives with the right care ."
//            ],
//            [
//                "title": "How to Discuss Your Depression with Your Loved Ones",
//                "image": UIImage(named: "depression2"),
//                "desc": "This blog article will offer suggestions for how to talk about depression with family and friends, as well as guidance on how to deal with stigma and find support.\n\nTalking about depression can be challenging, especially with close friends and family. But talking about your sadness and opening up about it can help you obtain the support you need to deal with your symptoms and enhance your mental health.\n\nHere are some suggestions for how to discuss your depression with your loved ones:\n\nGetting ready for the conversation \n- Spend some time getting ready before starting the discussion. Make a note of what you want to say and consider the reaction you desire from your loved ones. If you are concerned about how they may react, attempt to guess what they might say and consider your options for responding.\n\nPick the ideal moment and location\n- It's crucial to pick a time and location where you and your loved ones may speak in privacy and without interruption. Make sure everyone is at ease and not preoccupied with anything else.\n\nBeginning the discussion\n- Tell your loved ones that you want to talk about something that is important to you to start. It would be beneficial to provide some concrete examples of how depression has affected your daily life, moods, and relationships.\n\nBe direct and truthful\n- Be open and honest about your struggles when talking to your loved ones about your thoughts and feelings. Tell them what you need from them in terms of support and how they can help.\n\nManage stigma\n- Regrettably, stigma about mental health problems is still prevalent. It's possible that your loved ones don't comprehend your despair or have false perceptions of it. Be prepared to clarify any misperceptions they may have and educate them about depression.\n\nSeek help\n- It can be emotionally taxing to talk about depression, so it's critical to have a support network in place. For more support, think about contacting a therapist, support group, or helpline.\n\nA follow-up\n- Follow up with your loved ones to let them know how you are doing after the talk. Keep them informed of your success and let them know how much you value their support.\n\nAlthough talking about depression might be difficult, it's a crucial step in controlling your symptoms and obtaining the help you require. You can start a helpful and encouraging conversation with your loved ones by using these suggestions. Remind yourself that asking for assistance is OK and that you have friends and family who want to encourage you on your path to greater mental health."
//            ],
//            [
//                "title": "HOW TO MANAGE DEPRESSION IN THE WORKPLACE: DEPRESSION AND WORK",
//                "image": UIImage(named: "depression3"),
//                "desc": "This blog post will include tips for dealing with depression at work, such as communicating with your boss and any potential accommodations.\n\nA person's capacity to perform at work may be significantly impacted by depression. However, there are methods that can help people with depression control their symptoms while continuing to work effectively. Here are some suggestions for dealing with depression at work:\n\nTalk to your employer\n- If you're experiencing depression, it's crucial to let your employer know how you're feeling. This may entail stating your diagnosis, going over your symptoms, and, if necessary, asking for modifications. Be upfront and honest about your struggles, and be prepared to provide documentation from your healthcare provider if requested.\n\nCreate a support system\n- You can better control your symptoms and handle workplace stress by creating a support system. This could entail speaking with a therapist, joining a support group, or confiding in close friends or coworkers. Even if it takes time away from work to attend therapy or receive medical care, it's critical to give your mental health and well-being top priority.\n\nSelf-Care \n- Self-care is crucial for managing depression in the workplace. Therefore, practice. This may entail partaking in enjoyable stress-reduction activities like exercise, meditation, or creative hobbies. Additionally, it's crucial to emphasise getting enough sleep and eating a balanced diet because these things can significantly affect how you feel and how much energy you have.\n\nCreate attainable goals \n- Achieving attainable goals can keep you motivated and productive at work while preventing feelings of overload or burnout. Divide big projects into smaller, easier-to-manage activities, and give your most crucial obligations top priority. Honour your successes and reward yourself for a job well done.\n\nUtilize accommodations\n- If you've told your employer that you suffer from depression, you might be qualified for modifications under the Americans with Disabilities Act (ADA). This can entail asking for adjustments to your work schedule, responsibilities, or actual workspace. Find accommodations that match your needs and help you do your job well by working with your employer. \n\nIn conclusion, managing depression at work might be difficult, but there are ways to do so. You may manage your symptoms and continue to be productive at work by talking to your employer, getting assistance, taking care of yourself, setting reasonable objectives, and using accommodations. If you suffer from depression, it's crucial to put your mental health and well-being first. If necessary, you should also seek the assistance of a mental health expert. "
//            ],
//            [
//                "title": "Five Strategies for managing depression through self-care",
//                "image": UIImage(named: "depression4"),
//                "desc": "This blog post will provide helpful advice for controlling depression, such as getting adequate sleep, working out frequently, and using mindfulness.\n\nA person's emotions, thoughts, and behaviours can all be impacted by a mental health disorder known as depression. It may result in melancholy, pessimism, and a lack of interest in once-pleasant pursuits. Self-care techniques can be useful in managing symptoms even if therapy and medication are frequently used in the treatment of depression.\n\nWe will go through five self-care techniques for controlling depression:\n\n- Take Time to Sleep: Sleep is essential for mental health and can significantly affect mood. Sleep changes, such as insomnia or excessive sleep, are frequent among depressed people. Sleep quality can be enhanced by adopting a calming nighttime routine and sticking to a regular sleep schedule. Prior to going to bed, staying away from caffeine and technology will help you sleep better.\n\n- Routine Exercise: A strong tool for controlling depression is exercise. It can elevate mood, boost vitality, and lessen stress and anxiety symptoms. At least 30 minutes a day of physical activity, such as walking, jogging, or yoga, can be useful. Exercise can also boost self-confidence and give people a sense of accomplishment.\n\n- Be present at the moment and observe thoughts and emotions without passing judgement by practising mindfulness. It can aid depressed people in reducing their negative thought patterns and increasing their awareness of their feelings. Deep breathing exercises and other mindfulness techniques can help people feel more at ease and in the moment.\n\n- Connect with Others: Social support is a crucial component of depression management. While loneliness and isolation can make symptoms worse, social interaction can provide one with a sense of community and support. It can be beneficial to spend time with close friends and family, join a support group, or get involved in your neighborhood.\n\n- Self-care activities include whatever you do to advance your physical, emotional, or mental well-being. Self-care activities like having a bubble bath, reading a book, or listening to music can help people unwind and recharge. Prioritising one's needs and taking a break from the stresses of daily life are two more benefits of self-care.\n\nIn summary, self-care techniques can be useful in treating depression. Practical suggestions that can assist people in feeling better and enhancing their mental health include getting adequate sleep, exercising frequently, practising mindfulness, connecting with others, and practising self-care. Self-care can be a beneficial addition to therapy and medication, even though it is not a replacement for professional treatment."
//            ],
//            [
//                "title": "THERAPY'S IMPACT ON THE TREATMENT OF DEPRESSION",
//                "image": UIImage(named: "depression5"),
//                "desc": "The advantages of therapy for treating depression, as well as the various forms of therapy and what to expect throughout treatment, will be covered in this blog post. \n\nMillions of individuals throughout the world suffer from depression, a prevalent mental health issue. Therapy has been proven to be an effective strategy to manage and alleviate symptoms of depression, despite the fact that there are many different treatment choices accessible. We will discuss the function of therapy in treating depression in this blog article, as well as its advantages, various forms, and what to anticipate throughout treatment.\n\nBenefits of Depression Therapy\n- People with depression can benefit greatly from therapy. Among these advantages are:\n- Better symptom management: Therapy can assist depressed people in learning coping mechanisms and skills to control their symptoms, such as poor mood, lack of motivation, and negative thought patterns.\n- Enhanced self-awareness: Therapy can assist people in understanding their feelings, ideas, and behaviours. This can help them better understand their depression and assist them in finding more effective coping mechanisms.\n- Reduced social isolation: Depression frequently causes people to withdraw from others, yet treatment offers a secure environment where people can connect and form deep bonds.\n- Enhanced problem-solving abilities: Depression patients who receive therapy might improve their problem-solving abilities, which can give them a sense of empowerment and control over their lives.\n\nDepression Treatment Options\n- The following are a few different types of therapy that can be beneficial in the treatment of depression: \n- Behavioral Cognitive Therapy (CBT): Changes in depressive-contributing behaviours and cognitive patterns are the main goals of CBT, a type of therapy. It teaches students how to recognize unfavourable thoughts, challenge them, and swap them out for more uplifting and sensible ones.\n- Interpersonal therapy (IPT) is a type of counselling that focuses on enhancing interpersonal connections and communication. It can be especially beneficial for people who experience social isolation and loneliness.\n- Psychodynamic Counseling: The goal of psychodynamic therapy is to assist patients in acquiring an understanding of their prior relationships and experiences by examining unconscious behavioural and emotional patterns that may lead to depression.\n- Therapy that emphasises mindfulness: Individuals who receive mindfulness-based therapy learn to live in the moment and gain nonjudgmental awareness of their thoughts and feelings. It can be particularly beneficial for controlling stress and anxiety, which are frequent causes of depression.\n\nWhat to anticipate in therapy\n- People seeking treatment for depression should anticipate working cooperatively with their therapist to create a personalised treatment plan that addresses their unique needs and objectives. Therapy sessions normally range between 50 and 60 minutes and can be either solo or group-based.\n- People can anticipate discussing their ideas, feelings, and experiences relating to their depression in therapy. Talk therapy, cognitive-behavioural therapies, and mindfulness exercises are just a few of the approaches therapists may employ to assist clients in managing their symptoms and enhancing their quality of life.\n\nConclusion\n- Therapy is a powerful tool for controlling and reducing depressive symptoms. Therapy can help people with depression have more rewarding and meaningful lives by offering a secure and encouraging environment to explore emotions, create coping mechanisms, and enhance relationships. Consider talking to a mental health expert if you are experiencing depression to find out more about how therapy can benefit you ."
//            ]
//        ]
    let arrDepression = [
            [
                "title": "What_Is_Depression_Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                "image": UIImage(named: "professional"),
                "desc": "What_Is_Depression_Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            ],
            [
                "title": "How_to_Discuss_Your_Depression_with_Your_Loved_Ones_Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                "image": UIImage(named: "depression2"),
                "desc": "How_to_Discuss_Your_Depression_with_Your_Loved_Ones_Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            ],
            [
                "title": "How_to_Manage_Depression_in_the_Workplace_Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                "image": UIImage(named: "depression3"),
                "desc": "How_to_Manage_Depression_in_the_Workplace_Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            ],
            [
                "title": "Five_Strategies_for_managing_depression_through_self_care_Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                "image": UIImage(named: "depression4"),
                "desc": "Five_Strategies_for_managing_depression_through_self_care_Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            ],
            [
                "title": "Therapys_Impact_on_the_Treatment_of_Depression_Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),
                "image": UIImage(named: "depression5"),
                "desc": "Therapys_Impact_on_the_Treatment_of_Depression_Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            ]
        ]
    let arrAnxiety = [["title":"anxiety1_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety1"),"desc":"anxiety1_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                    ["title":"anxiety2_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety2"),"desc":"anxiety2_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                        ["title":"anxiety3_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety3"),"desc":"anxiety3_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                          ["title":"anxiety4_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety4"),"desc":"anxiety4_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                      ["title":"anxiety5_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety5"),"desc":"anxiety5_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                      
                        ["title":"anxiety6_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety6"),"desc":"anxiety6_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                      ["title":"anxiety7_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety7"),"desc":"anxiety7_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")] ,
                      
                      
                      ["title":"anxiety8_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "anxiety8"),"desc":"anxiety8_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                      
                      
                      
                      ["title":"anxiety9_title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "professional"),"desc":"anxiety9_desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]]
        
        
        
        let arrAddiction = [["title":"Addiction1Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "addiction1"),"desc":"Addiction1Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                        
            ["title":"Addiction2Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "addiction2"),"desc":"Addiction2Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                            
            ["title":"Addiction3Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "addiction3"),"desc":"Addiction3Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                            
            ["title":"Addiction4Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "addiction4"),"desc":"Addiction5Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                            
            ["title":"Addiction5Title".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "addiction5"),"desc":"Addiction5Desc".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]]
    
    
    
    let arrpsychosis = [["title":"title_understanding_connection_schizophrenia_substance_abuse".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "psychosis1"),"desc":"desc_understanding_connection_schizophrenia_substance_abuse".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                            
                ["title":"title_misconceptions_stigma_psychosis".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "psychosis2"),"desc":"desc_misconceptions_stigma_psychosis".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
           
                            
                ["title":"title_coping_strategies_support_resources_psychosis".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "psychosis3"),"desc":"desc_coping_strategies_support_resources_psychosis".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                            
                ["title":"title_connection_psychosis_trauma".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "psychosis4"),"desc":"desc_connection_psychosis_trauma".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                            
                   ["title":"title_understanding_schizophrenia_signs_causes_treatments".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "psychosis5"),"desc":"desc_understanding_schizophrenia_signs_causes_treatments".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]]
       
        
        let arrBipolar = [["title":"title_manage_bipolar_affective_disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "bipolar1"),"desc":"desc_manage_bipolar_affective_disorder".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                          
            ["title":"title_medications_therapies_bipolar".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "bipolar2"),"desc":"desc_medications_therapies_bipolar".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                          
            ["title":"title_relationships_bipolar".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "bipolar1"),"desc":"desc_relationships_bipolar".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                          
            ["title":"title_stigma_bipolar".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "bipolar3"),"desc":"desc_stigma_bipolar".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]]
        
        let arrOther = [["title":"title_identifying_managing_children_disorders".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "disorder1"),"desc":"desc_identifying_managing_children_disorders".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
                        
            ["title":"title_linkage_trauma_emotional_disorders".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "disorder2") ,"desc":"desc_linkage_trauma_emotional_disorders".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
            
            ["title":"title_mindfulness_benefits".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "disorder3"),"desc":"desc_mindfulness_benefits".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")],
            
            ["title":"title_therapy_importance".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "disorder4"),"desc":"desc_therapy_importance".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")]]
        
        

    

    override func viewDidLoad() {
        super.viewDidLoad()
        loader.isHidden = true
        print(arrOfProblemTopicHeading)
      //  self.titleBackground.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
           // self.tblView.insertSubview(imageView, at: 0)
            //self.titleBackground.insertSubview(imageView, at: 0)
        }
       // self.tblView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
       
        
        txtTitle.text = HeadingLblNameOfView
        tblView.delegate = self
        tblView.dataSource = self
        webView.isHidden = true
        tblView.separatorStyle = .none
        RegisterNIb()
    }
  
    func RegisterNIb(){
        
        tblView.register(UINib(nibName: "HeaderTableViewCell", bundle: .main), forCellReuseIdentifier: "HeaderTableViewCell")
        tblView.register(UINib(nibName: "LabelTableViewCell", bundle: .main), forCellReuseIdentifier: "LabelTableViewCell")
        tblView.register(UINib(nibName: "CollectionTableViewCell", bundle: .main), forCellReuseIdentifier: "CollectionTableViewCell")
        tblView.register(UINib(nibName: "LastTableViewCell", bundle: .main), forCellReuseIdentifier: "LastTableViewCell")
    }
   
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension MeditationViewController:AnxityDelegate , LastCellDelegate,WKUIDelegate,WKNavigationDelegate{
    func didSelectCollectionView(indexPath: IndexPath, collectionView: UICollectionView, delegateName: String) {
        print(indexPath.row)
        print(delegateName)
        
       

        
        var arrResourceName = ["https://youtu.be/GjEoXtPC0FE?feature=shared","https://www.youtube.com/watch?v=GjEoXtPC0FE","v3","v4","v5"]
        
       
        
        
        if delegateName == "Popular"{
            
            var vc = self.storyboard?.instantiateViewController(withIdentifier: "blogs") as? MentalBlogsViewController
            
            if HeadingLblNameOfView == "Addiction"{
//                    print("HEllo")
                vc?.arrData = arrAddiction[indexPath.row]
             
            }else if HeadingLblNameOfView == "Depression" {
                vc?.arrData = arrDepression[indexPath.row]
                
            }else if HeadingLblNameOfView == "Anxiety" {
                vc?.arrData = arrAnxiety[indexPath.row]
               
            }else if HeadingLblNameOfView == "Bipolar Disorder" {
                vc?.arrData = arrBipolar[indexPath.row]
               
            }else if HeadingLblNameOfView == "Psychosis" {
                vc?.arrData = arrpsychosis[indexPath.row]
               
            }else{
                vc?.arrData = arrOther[indexPath.row]
            }
                
            self.navigationController?.pushViewController(vc!, animated: true)
        
            
      }
            
        else {
            
            webView.uiDelegate = self
            webView.navigationDelegate = self
            
         let arrAddiction = [["title":"addiction","url":"https://youtu.be/GjEoXtPC0FE?feature=shared"],["title":"Internet Addiction kya hai ?","url":"https://www.youtube.com/watch?v=vfly2E9VobA"],["title":"Addiction kya hai aur kaise theek hoga ? ","url":"https://www.youtube.com/watch?v=_k_1Q6lM2d8"]]
         let arrDepression = [["title":"Depression ki dawao ka depression hota haii","url":"https://youtu.be/Mx8wKBUAhIU?feature=shared"],["title":"Side effect of anti depressant","url":"https://youtu.be/DQNPqImUA2I?feature=shared"],["title":"Kya depression genetically hota hai","url":"https://youtu.be/7yxe4L3JdsI?feature=shared"],["title":"Depression ke patient ki lifestyle kaise honi chahiye","url":"https://youtu.be/9wmxNJN-EIk?feature=shared"],["title":"Aap depression ke patient ki kaise help kar sakte hain/ how family can help depression","url":"https://www.youtube.com/watch?v=OHLoPp1n2Pk"],["title":"Teen Cheezin Jo Batati Hain Depression Theek hoga","url":"https://www.youtube.com/watch?v=xSQLbzHA6oE"],["title":"Brain changes in patients of Depression ","url":"https://www.youtube.com/watch?v=WDw3irBfa5k"],["title":"Depression counselling se theek hota hai","url":"https://www.youtube.com/watch?v=Chw2vlXrxnk"],["title":"Why depression is increasing in Society ? ","url":"https://www.youtube.com/watch?v=eOnRkmEmbFc"],["title":" Depression ka ilaaj Kab tak chalega ?","url":"https://www.youtube.com/watch?v=RU3T1zJWWP4"],["title":"Kaise Pata Chalega Depression Hai Ya Nahi ","url":"https://www.youtube.com/watch?v=15cSZ57FXwM"],["title":"Why one get Depression","url":"https://www.youtube.com/watch?v=sIE92IdlpmA"]]
          let arrAnxiety = [["title":"Three Minute Exercise for Anxiety Relief","url":"https://youtu.be/E-n-ib5LFfw?feature=shared"],["title":"Handling Anxiety","url":"https://www.youtube.com/watch?v=dnbLVPXe710"],["title":"ANXIETY DUE TO CORONA","url":"https://www.youtube.com/watch?v=9oUxfDUZMwY"]]
          let arrpsychosis = [["title":"Psychosis Shak ki beemari (schizophrenia) theek ho sakti hai","url":"https://www.youtube.com/watch?v=-sRgpaAVsTg"],["title":"What is Schizophrenia (psychosis) and what causes it","url":"https://www.youtube.com/watch?v=iEmXHdQBgNE"]]
           let arrBipolar = [["title":"Bipolar disorder kya hai ?","url":"https://www.youtube.com/watch?v=s9tp7hvsHio"]]
           let arrOthers = [["title":"Sucide Prevention","url":"https://www.youtube.com/watch?v=FjntSI0RGHo"],["title":"Gussa kaise control hoga?","url":"https://www.youtube.com/watch?v=xSjGSotlsDQ&list=PL3bDxrSJJ_GYbe27GSCmJgPlMd5xEpYPD"],["title":"Migraine kaise theek hoga","url":"https://www.youtube.com/watch?v=GAm7mpbuxAw&list=PL3bDxrSJJ_GYbe27GSCmJgPlMd5xEpYPD&index=4"]]

            
            
            
            if HeadingLblNameOfView == "Addiction"{
//                    print("HEllo")
                    
                let myURL = URL(string: arrAddiction[indexPath.row]["url"] ?? "")
                    let myRequest = URLRequest(url: myURL!)
                    //print(myRequest)
                  
                    webView.load(myRequest)
                    
                    webView.isHidden = false
                    webView.isHidden = true
           
            }else if HeadingLblNameOfView == "Depression" {
                let myURL = URL(string: arrDepression[indexPath.row]["url"] ?? "")
                    let myRequest = URLRequest(url: myURL!)
                    //print(myRequest)
                  
                    webView.load(myRequest)
                    
                    webView.isHidden = false
                    webView.isHidden = true
               
            }else if HeadingLblNameOfView == "Anxiety" {
                let myURL = URL(string: arrAnxiety[indexPath.row]["url"] ?? "")
                    let myRequest = URLRequest(url: myURL!)
                   // print(myRequest)
                    
                    webView.load(myRequest)
                    
                    webView.isHidden = false
                    webView.isHidden = true
               
            }else if HeadingLblNameOfView == "Bipolar Disorder" {
                let myURL = URL(string: arrBipolar[indexPath.row]["url"] ?? "")
                    let myRequest = URLRequest(url: myURL!)
                    print(myRequest)
                   
                    webView.load(myRequest)
                    
                    webView.isHidden = false
                    webView.isHidden = true
               
            }else if HeadingLblNameOfView == "Psychosis" {
                let myURL = URL(string: arrpsychosis[indexPath.row]["url"] ?? "")
                    let myRequest = URLRequest(url: myURL!)
                    print(myRequest)
                   
                    webView.load(myRequest)
                    
                    webView.isHidden = false
                    webView.isHidden = true
               
            }else{
                let myURL = URL(string: arrOthers[indexPath.row]["url"] ?? "")
                    let myRequest = URLRequest(url: myURL!)
                    print(myRequest)
                    
                    webView.load(myRequest)
                    
                    webView.isHidden = false
                    webView.isHidden = true
                
            }
            
            
            
            
            
            
        }
    }
   
}
extension MeditationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDepression.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
           
           
            return cell
        }else if indexPath.row == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
//            txtTitle == arrOfName[index]
            
            cell.labelName.text = "Blogs".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
            return cell
  
        }else if indexPath.row == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as! CollectionTableViewCell
            cell.delegate = self
//          cell.countDepression = arrDepression.count
            cell.arrName = arrOfProblemTopicHeading
            
            
            
            return cell
  
        }else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
            
            cell.labelName.text = "Related Videos".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") 
            return cell
  
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastTableViewCell", for: indexPath) as! LastTableViewCell
            cell.delegate = self
            cell.arrTitle = arrVideoTopicHeading
            
            
            
//            cell
            
            return cell
  
        }
        
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            
            return 250
        }else if indexPath.row == 1 {
            
            return 50
        }else if indexPath.row == 2{
            
            return 170
        }else if indexPath.row == 3{
            
            return 40
        }else {
            
            return 170
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
           print("Start Request")
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
