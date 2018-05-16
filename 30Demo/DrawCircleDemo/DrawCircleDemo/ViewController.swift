//
//  ViewController.swift
//  DrawCircleDemo
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var circleView: iOSCircleView!
    
    override func loadView() {
        circleView = iOSCircleView.init(frame: UIScreen.main.bounds)
        view = circleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

