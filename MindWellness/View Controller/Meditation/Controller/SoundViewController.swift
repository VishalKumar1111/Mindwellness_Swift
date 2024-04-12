//
//  SoundViewController.swift
//  MindWellness
//
//  Created by Reetesh Bajpai on 24/02/23.
//

import UIKit
import AVKit
import AVFoundation

class SoundViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playVideo()
        if let backgroundImage = UIImage(named: "Background") {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = backgroundImage
            self.view.insertSubview(imageView, at: 0)
        }
    }
    
    
    func playVideo(){
        guard let videoURL = Bundle.main.url(forResource: "v1", withExtension: "mp4") else {
            print("Video Not Found.")
            return
        }

        // Create an AVPlayer instance with the video URL
        let player = AVPlayer(url: videoURL)

        // Create an AVPlayerViewController instance
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            // Start playing the video when the player view controller is presented
            player.play()
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
