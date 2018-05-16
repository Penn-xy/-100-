//
//  File.swift
//  ExtenstionSet
//
//  Created by apple on 2018/5/15.
//  Copyright © 2018年 Xu. All rights reserved.
//

import UIKit


extension UIApplication {
    
    static func showNetworkActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    static func hiddenNetworkActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}


extension UIPasteboard {
    
    static func copyString(_ string: String?) {
        UIPasteboard.general.string = string
    }
    
}

extension UIViewController {
    
}

extension Array {
    typealias T = Element
    func getRandomElement() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
