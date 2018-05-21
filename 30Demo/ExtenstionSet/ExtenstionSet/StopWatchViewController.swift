//
//  StopWatchViewController.swift
//  ExtenstionSet
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (_) in
            self.UpdateTimer()
        })
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: AnyObject) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetTimer(_ sender: AnyObject) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }
    
    func UpdateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            debugPrint("摇一摇")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
