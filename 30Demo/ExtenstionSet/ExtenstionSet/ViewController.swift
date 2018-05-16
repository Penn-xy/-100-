//
//  ViewController.swift
//  ExtenstionSet
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAction(_ sender: UIButton) {
        UIApplication.showNetworkActivityIndicator()
        self.indicatorView.startAnimating()
    }
    
    @IBAction func hiddenAction(_ sender: UIButton) {
        UIApplication.hiddenNetworkActivityIndicator()
        self.indicatorView.stopAnimating()
    }
    
}

