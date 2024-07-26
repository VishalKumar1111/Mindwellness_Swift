//
//  MedSoundViewController.swift
//  MindWellness
//
//  Created by RLogixxTraining on 29/09/23.
//

import UIKit
import AVFoundation
import AVKit

class MedSoundViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
   
    var player: AVPlayer!
    var playerController: AVPlayerViewController!
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var txtTitle: UILabel!
    
    var arr = [["name" : "sunset_view".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") ,"image":UIImage(named: "sunset")!], ["name":"stars".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") ,"image": UIImage(named: "star" )!], ["name":"relaxing_ocean_sound".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "") ,"image": UIImage(named: "ocean sound")!] ,["name": "wave".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "wave")!],["name" :"nature_sound".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? ""),"image":UIImage(named: "nature")!]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        txtTitle.text = "Meditation Sounds".localizableString(forLocalization: UserDefaults.standard.string(forKey: "currentLanguage") ?? "")
    
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
//        tblView.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        tblView.delegate = self
        tblView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 185.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "storytable"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SoundMedTableViewCel
        if cell == nil {
            tableView.register(UINib(nibName: "SoundMedTableViewCel", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SoundMedTableViewCel
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Imageclick))
        cell?.imgView.isUserInteractionEnabled = true
        cell?.imgView.addGestureRecognizer(tapGesture)
        cell?.imgView.tag = indexPath.row
        
        cell?.lblMed.text = arr[indexPath.row]["name"] as? String
        
        cell?.imgView.image = arr[indexPath.row]["image"] as? UIImage
        tapGesture.view?.tag = indexPath.row
        
        return cell!

        
        
    }
    
    @objc func Imageclick(sender : UITapGestureRecognizer) {
        let tag = (sender.view?.tag as? Int)!
//        let tag = sender.tag
//        print(tag)
        var video = ["v1","v2","v3","v4","v5"]
//        path = sender.tag
//        print(video[sender.tag])
        
        guard let path = Bundle.main.path(forResource: video[tag], ofType:"mp4") else {
                debugPrint("v1.m4v not found")
                return
            }



        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController = AVPlayerViewController()
        playerController.player = player
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: nil)

        present(playerController, animated: true) {
            self.player.play()
            
            
        }
        
        
    }
    
    @objc func playerDidFinishPlaying(notification: Notification) {
           if let playerItem = notification.object as? AVPlayerItem {
               // Seek to the beginning and play again
               playerItem.seek(to: .zero)
               player.play()
           }
       }
    
    
    @IBAction func btnBack(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "CarouselViewController") as? CarouselViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        self.navigationController?.popViewController(animated: true) 
        
    }
    

    
    

   

}
