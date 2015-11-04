//
//  ViewController.swift
//  shake-that-app
//
//  Created by Jason Shultz on 10/22/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer() // Create a player
    var tune:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        
        self.view.addGestureRecognizer(swipeUp)
        
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            print("device was shaken, not stirred")
        }
    }
    
    func playSound(tune:String) {
        
        let audioPath = NSBundle.mainBundle().pathForResource(tune, ofType: "mp3")! // path to audio file
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch {
            print("siomething went wrong")
        }
        
    }
    
    func swiped(gesture:UIGestureRecognizer){
        if let swipegesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipegesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                
                print("swipe right")
            case UISwipeGestureRecognizerDirection.Up:
                let audioPath = NSBundle.mainBundle().pathForResource("mozart-k311-3-sasaki", ofType: "mp3")! // path to audio file
                print("swipe up")
            default:
                break
            }
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

