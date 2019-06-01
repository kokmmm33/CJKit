//
//  UIColor-Extention.swift
//  XYTV
//
//  Created by 蔡杰 on 2018/2/26.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r : CGFloat, g :CGFloat, b :CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }

    convenience init?(hex : Int, alpha : CGFloat = 1.0) {
        let r : CGFloat = CGFloat((hex & 0xFF0000) >> 16)
        let g : CGFloat = CGFloat((hex & 0xFF00) >> 8)
        let b : CGFloat = CGFloat(hex & 0xFF)
        self.init(r: r, g: g, b: b, alpha: alpha)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    func getCgcolor() -> (CGFloat, CGFloat, CGFloat) {
        guard let rgb = cgColor.components else {
            fatalError("UIColor 不是RGB值");
        }
        return (rgb[0]*255.0, rgb[1]*255.0, rgb[2]*255.0)
    }
    
     class func getRGBDelta(firstColor: UIColor, secondColor : UIColor) -> (CGFloat, CGFloat, CGFloat) {
        let firstRGB = firstColor.getCgcolor()
        let secondRGB = secondColor.getCgcolor()
        return (firstRGB.0 - secondRGB.0, firstRGB.1 - secondRGB.1, firstRGB.2 - secondRGB.2)
    }
}
