//
//  SpringAnimateViewController.swift
//  ExtenstionSet
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class SpringAnimateViewController: UIViewController {
    var labelPositionIsLeft = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func startAnimation(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            if self.labelPositionIsLeft {
                self.label.center.x = self.view.bounds.width - 100
            }
            else {
                self.label.center.x = 100
            }
            self.labelPositionIsLeft = !(self.labelPositionIsLeft)
        }, completion: nil)
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
