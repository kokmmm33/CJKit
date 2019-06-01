//
//  UIButton-Extension.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/10.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import UIKit

enum ButtonContentPostion {
    case imageTop;
    case imageLeft;
    case imageBottom;
    case imageRight;
}

extension UIButton {
    func layoutContentPositon(position : ButtonContentPostion, margin : CGFloat = 5.0) {
        guard let imageW = imageView?.image?.size.width else {
            return
        }
        guard let imageH = imageView?.image?.size.height else {
           return
        }
        // 由于iOS8及以上版本中titleLabel的size为0，用下面的这种获取
        guard let labelW = titleLabel?.intrinsicContentSize.width else {
            return
        }
        guard let labelH = titleLabel?.intrinsicContentSize.height else {
            return
        }
        
        var imageInsets = UIEdgeInsets.zero
        var labelInsets = UIEdgeInsets.zero
        
        switch position {
        case .imageTop:
            do {
                imageInsets = UIEdgeInsets(top: -labelH-margin/2.0, left: 0, bottom: 0, right: -labelW);
                labelInsets = UIEdgeInsets(top: 0, left: -imageW, bottom: -imageH-margin/2.0, right: 0);
        }
        case .imageLeft:
            do {
                imageInsets = UIEdgeInsets(top: 0, left: -margin/2.0, bottom: 0, right: margin/2.0);
                labelInsets = UIEdgeInsets(top: 0, left: margin/2.0, bottom: 0, right: -margin/2.0);
        }
        case .imageBottom:
            do {
                imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelH-margin/2.0, right: -labelW);
                labelInsets = UIEdgeInsets(top: -imageH-margin/2.0, left: -imageW, bottom: 0, right: 0);
        }
        case .imageRight:
            do {
                imageInsets = UIEdgeInsets(top: 0, left: labelW+margin/2.0, bottom: 0, right: -labelW-margin/2.0);
                labelInsets = UIEdgeInsets(top: 0, left: -imageW-margin/2.0, bottom: 0, right: imageW+margin/2.0);
        }
        }
        titleEdgeInsets = labelInsets
        imageEdgeInsets = imageInsets
    }

	public func setupLabel(_ attribute: (UIFont, UIColor, String)) {
		setTitle(attribute.2, for: .normal)
		titleLabel?.textColor = attribute.1
		titleLabel?.font = attribute.0
	}
}

// MARK:- 倒计时
typealias counteHandle = ((Int, UIButton)->())
extension UIButton {
	static var timeoutDuration: Int = 60
	static var timer : Timer?
	static var actionHandle: counteHandle?
	fileprivate static var currentSec: Int = 60
	
	func startCount(repeatHandle: @escaping counteHandle) {
		UIButton.actionHandle = repeatHandle
		self.isUserInteractionEnabled = false
		UIButton.currentSec = UIButton.timeoutDuration
		UIButton.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countSec), userInfo: nil, repeats: true)
		
	}
	
	@objc fileprivate func countSec() {
		if let handle = UIButton.actionHandle {
			handle(UIButton.currentSec, self)
		}
		if UIButton.currentSec < 0 {
			self.setTitle("发送验证码", for: .normal)
			self.isUserInteractionEnabled = true
			UIButton.actionHandle = nil
			UIButton.timer?.invalidate()
			return
		}
		self.setTitle("\(UIButton.currentSec)", for: .normal)
		UIButton.currentSec -= 1;
	}
}

extension UIButton {
	func start(withTime timeLimit: Int, title: String = "发送验证码", mainColor: UIColor?, countColor: UIColor?) {
		var count = timeLimit
		self.isUserInteractionEnabled = false
		let timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
		timer.schedule(deadline: .now(), repeating: Double(1))
		timer.setEventHandler {
			DispatchQueue.main.async(execute: {
				if count < 0 {
					self.setTitle("发送验证码", for: .normal)
					self.setTitleColor(mainColor, for: .normal)
					self.isUserInteractionEnabled = true
					timer.cancel()
				}else {
					let titleStr = String(format: "%ds", count)
					self.setTitleColor(countColor, for: .normal)
					self.setTitle(titleStr, for: .normal)
				}
			})
			count -= 1
		}
		timer.resume()
	}

}
