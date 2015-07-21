//
//  ViewController.swift
//  Music Shuffler
//
//  Created by Brad Gray on 7/21/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var music = ["awake and alive", "Comatose", "don't wake me", "Hero"]
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var error: NSError? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
      }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            
            var randomNumber = Int(arc4random_uniform(UInt32(music.count)))
            var audioPath = NSBundle.mainBundle().pathForResource(music[randomNumber], ofType: "m4a")!
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath), fileTypeHint: "m4a", error: &error)
            
            if error == nil {
                player.play()
            } else {
                println(error)
                
            }
            
            
          

            
        }
    }
    
    
    @IBAction func Stop(sender: UIButton) {
        player.stop()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

