//
//  UIView_Extention.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/10.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import UIKit

extension UIView {
    var cj_width : CGFloat {
        get {
            return frame.width
        }
        
        set {
            let newSize = CGSize(width: newValue, height: frame.height)
            frame.size = newSize
        }
    }
    
    var cj_height : CGFloat {
        get {
            return frame.height
        }
        set {
            let newSize = CGSize(width: frame.width, height: newValue)
            frame.size = newSize
        }
    }
    
    var cj_x : CGFloat {
        get {
            return frame.origin.x
        }
        
        set {
            let point = CGPoint(x: newValue, y: frame.origin.y)
            frame.origin = point
        }
    }
    
    var cj_y : CGFloat {
        get {
            return frame.origin.y
        }
        
        set {
            let point = CGPoint(x: frame.origin.x, y: newValue)
            frame.origin = point
        }
    }
    
    var cj_centerX : CGFloat {
        get {
            return self.cj_x + self.cj_width * 0.5
        }
        
        set {
            self.center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    var cj_centerY : CGFloat {
        get {
            return self.cj_y + self.cj_height * 0.5
        }
        
        set {
            self.center = CGPoint(x: center.x, y: newValue)
        }
    }
}

extension UIView {
// 当前所在的控制器
    var viewController : UIViewController? {
        var nextResponse = next
        repeat {
            if (nextResponse?.isKind(of: UIViewController.self))! {
                return nextResponse as? UIViewController;
            }
            nextResponse = nextResponse?.next
        }while nextResponse != nil;
        return nil
    }
// 顶层父视图
    var topView : UIView? {
        var superV = superview
        var lastSuperV : UIView?   
        repeat {
            if superV != nil {
                lastSuperV = superV
                superV = superV?.superview
            }
        }while superV != nil;
        return lastSuperV
    }
}

// MARK:- 功能拓展
var shadowLayer = CALayer()
extension UIView {

	/// 同时设置view的圆角和阴影
	public func setupCornerShadow(cornerRadius : CGFloat = 5.0, borderWidth: CGFloat = 3.0, borderColor: UIColor = UIColor.white, shadowOffset : CGSize = .zero, shadowColor : UIColor = .red, shadowOpacity : CGFloat = 0.8) {
        if cornerRadius == 0 {
            return
        }
        assert(self.superview != nil, "设置圆角和阴影前先添加到父视图中")
        assert(self.frame != CGRect.zero, "设置圆角和阴影前先,frame不能为零")
        if let mask = objc_getAssociatedObject(self, "shadowLayer") as? CALayer {
            mask.removeFromSuperlayer()
        }
        let shadowLayer = CALayer()
        objc_setAssociatedObject(self, "shadowLayer", shadowLayer, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        shadowLayer.frame = self.frame.insetBy(dx: -borderWidth, dy: -borderWidth)
        shadowLayer.backgroundColor = borderColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = Float(cornerRadius);
        shadowLayer.cornerRadius = cornerRadius;
        self.superview?.layer.insertSublayer(shadowLayer, below: self.layer)
        self.layer.masksToBounds = true;
        self.layer.cornerRadius = cornerRadius;
    }
}

// MARK: - xib初始化
extension UIView {
	/// 返回UIView名字
	class func name() ->String {
		return "\(self)"
	}
	class func instantiateFromNib() -> UIView {
		return Bundle.main.loadNibNamed(name(), owner: nil, options: nil)?.first as! UIView
	}
}

