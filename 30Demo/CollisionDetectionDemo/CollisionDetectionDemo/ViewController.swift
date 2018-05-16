//
//  ViewController.swift
//  CollisionDetectionDemo
//
//  Created by apple on 2018/5/16.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [.red, .blue, .green, .purple, .gray]
    
    let sizeOfSquare = CGSize.init(width: 50, height: 50)
    
    var squareViews = [UIView]()
    
    var leftBoundaryHeight: CGFloat { return self.view.bounds.size.height - 100.0 }
    var middleBoundaryHeight: CGFloat { return self.view.bounds.size.height - 150.0 }
    var rightBoundaryHeight: CGFloat { return self.view.bounds.size.height - 100.0 }
    var leftBoundaryWidth: CGFloat { return self.view.bounds.size.width/3 }
    var middleBoundaryWidth: CGFloat { return self.view.bounds.size.width * 0.67 }
    var leftSquareCenterPointX: CGFloat { return self.view.bounds.size.width/6 }
    var middleSquareCenterPointX: CGFloat { return self.view.bounds.size.width/2 }
    var rightSquareCenterPointX: CGFloat { return self.view.bounds.size.width * 0.84 }
    var squareCenterPointY: CGFloat { return self.view.bounds.size.height - 400 }
    
    var animator: UIDynamicAnimator!
    
    var centerPoint: Array<CGPoint> {
        return [CGPoint.init(x: leftSquareCenterPointX, y: squareCenterPointY),
                CGPoint.init(x: middleSquareCenterPointX, y: squareCenterPointY),
                CGPoint.init(x: rightSquareCenterPointX, y: squareCenterPointY)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action
    
    @IBAction func releaseNextSquareAction(_ sender: UIButton) {
        
        let newView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.sizeOfSquare.width, height: self.sizeOfSquare.height))
        newView.backgroundColor = colors.getRandomElement()
        newView.center = centerPoint.getRandomElement()
        
        self.squareViews.append(newView)
        self.view.addSubview(newView)
        
        animator = UIDynamicAnimator.init(referenceView: self.view)
        
        let gravity = UIGravityBehavior.init(items: squareViews)
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior.init(items: squareViews)
        collision.addBoundary(withIdentifier: "leftBoundary" as NSCopying, from: CGPoint.init(x: 0, y: leftBoundaryHeight), to: CGPoint.init(x: leftBoundaryWidth, y: leftBoundaryHeight))
        collision.addBoundary(withIdentifier: "middleBoundary" as NSCopying, from: CGPoint.init(x: self.view.bounds.size.width/3, y: middleBoundaryHeight), to: CGPoint.init(x: middleBoundaryWidth, y: middleBoundaryHeight))
        collision.addBoundary(withIdentifier: "rightBoundary" as NSCopying, from: CGPoint.init(x: middleBoundaryWidth, y: rightBoundaryHeight), to: CGPoint.init(x: self.view.bounds.size.width, y: rightBoundaryHeight))
        collision.collisionMode = .everything

        animator.addBehavior(collision)
    }
    

}


extension Array {
    typealias T = Element
    func getRandomElement() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
