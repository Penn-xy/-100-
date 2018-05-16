//
//  iOSCircleView.swift
//  DrawCircleDemo
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

let MINRADIUS = 10
let MAXRADIUS = 30

class iOSCircleView: UIView {
    
    var totalCircles = [iOSCircle]()

    // MARK: - Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.isMultipleTouchEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(10.0);
        UIColor.red.set()
        
        for circle in totalCircles {
            context?.addArc(center: circle.circleCenter, radius: circle.circleRadius, startAngle: 0.0, endAngle: CGFloat(.pi * 2.0), clockwise: true)
            context?.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let iosCircle = iOSCircle.init(circleCenter: location, circleRadius: CGFloat(UInt32(MINRADIUS) + arc4random_uniform(UInt32(MAXRADIUS))))
            
            totalCircles.append(iosCircle)
            setNeedsDisplay()
        }
    }

}
