//
//  SnapBehaviorViewController.swift
//  ExtenstionSet
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class SnapBehaviorViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var animator:UIDynamicAnimator!
    var snapBehaviour:UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the Tap Gesture Recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userHasTapped))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userHasTapped(tap:)))
        self.view.addGestureRecognizer(tapGesture)
        
        // Create the Dynamic Animator
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    @objc func userHasTapped(tap:UITapGestureRecognizer) {
        let touchPoint = tap.location(in: self.view)
        if snapBehaviour != nil {
            animator.removeBehavior(snapBehaviour)
        }
        
        snapBehaviour = UISnapBehavior(item: imageView, snapTo: touchPoint)
        snapBehaviour.damping = 0.3
        animator.addBehavior(snapBehaviour)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
