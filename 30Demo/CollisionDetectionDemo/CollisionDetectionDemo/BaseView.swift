//
//  BaseView.swift
//  CollisionDetectionDemo
//
//  Created by apple on 2018/5/16.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit

class BaseView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawLine(fromPoint: 0, toPoint: self.bounds.size.width/3, phontY: self.bounds.size.height - 100.0)
        drawLine(fromPoint: self.bounds.size.width/3, toPoint: self.bounds.size.width*0.67, phontY: self.bounds.size.height - 150.0)
        drawLine(fromPoint: self.bounds.size.width*0.67, toPoint: self.bounds.size.width, phontY: self.bounds.size.height - 100.0)
    }
    
    func drawLine(fromPoint fromX: CGFloat, toPoint toX: CGFloat, phontY y: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(5.0)
        context?.move(to: CGPoint.init(x: fromX, y: y))
        context?.addLine(to: CGPoint.init(x: toX, y: y))
        context?.strokePath()
    }
 

}
