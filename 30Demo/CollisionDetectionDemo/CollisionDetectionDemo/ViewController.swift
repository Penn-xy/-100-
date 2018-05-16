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


}

