//
//  ViewController.swift
//  ChangeVolumeDemo
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "drum", ofType: ".mp3")
        let data = NSData.init(contentsOfFile: path!)
        audioPlayer = try! AVAudioPlayer.init(data: data! as Data)
        audioPlayer.prepareToPlay()
        audioPlayer.numberOfLoops = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action
    
    @IBAction func playSoundAction(_ sender: UIButton) {
        audioPlayer.play()
        
        let wrapperView = UIView.init(frame: CGRect.init(x: 20, y: 300, width: 260, height: 50))
        wrapperView.backgroundColor = .clear
        view.addSubview(wrapperView)
        
        let mPVolumeView = MPVolumeView.init(frame: wrapperView.bounds)
        wrapperView.addSubview(mPVolumeView)
    }
    

}

