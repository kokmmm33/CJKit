//
//  CJ_UIDevice_Extension.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/3/6.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import Foundation
import UIKit

// MARK:- CGSize - extension
extension CGSize: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		let size = NSCoder.cgSize(for: value)
		self.init(width: size.width, height: size.height)
	}
	
	public init(extendedGraphemeClusterLiteral value: String) {
		let size = NSCoder.cgSize(for: value)
		self.init(width: size.width, height: size.height)
	}
	
	public init(unicodeScalarLiteral value: String) {
		let size = NSCoder.cgSize(for: value)
		self.init(width: size.width, height: size.height)
	}
}

// MARK:- UIScreen - extension
extension UIScreen {
	static let screenWidth = UIScreen.main.bounds.size.width
	static let screenHeight = UIScreen.main.bounds.size.height
	static let SCREEN_MAX_LENGTH = max(screenWidth, screenHeight)
	static let SCREEN_MIN_LENGTH = min(screenWidth, screenHeight)
	
	static let statusBarHeitht: CGFloat =  UIApplication.shared.statusBarFrame.height
	static var navigationBarHeight: CGFloat = 44
	static var navHeitht: CGFloat{
		return  statusBarHeitht +  navigationBarHeight
	}
	
	/// 安全区底部高度
	static var extraBottom: CGFloat {
		if UIDevice.isScreenElongation {
			return 34
		}
		return 0
	}
	static let tabbarHeight: CGFloat = 49
	static var bottomHeight: CGFloat {
		return extraBottom + tabbarHeight
	}
}

// MARK:- UIDevice - extension
extension UIDevice {
	/// iPhone屏幕尺寸类型
	enum iPhones: CGSize, ExpressibleByNilLiteral {
		case iPhone3GS = "{320, 480}"
		case iPhone5 = "{320, 568}"
		case iPhone6 = "{375, 667}"
		case iPhone6Plus = "{414, 736}"
		case iPhoneXAndXS = "{375, 812}"
		case iPhoneXRAndMax = "{414, 896}"
		case unKnown
		public init(nilLiteral: Void) {
			self = .unKnown
		}
	}
	
	/// 当前设备屏幕类型
	static var iPhoneType: iPhones {
		let deviceSize = CGSize(width: UIScreen.SCREEN_MIN_LENGTH, height: UIScreen.SCREEN_MAX_LENGTH)
		return iPhones.init(rawValue: deviceSize) ?? .unKnown
	}
	
	static var isiPad: Bool {
		return UIDevice.current.userInterfaceIdiom == .pad
	}
	
	static var isScreenElongation: Bool {
		guard modelName !=  "Simulator" else {
			return [iPhones.iPhoneXAndXS,.iPhoneXRAndMax].contains(iPhoneType)
		}
		let elongationPhone = ["iPhone X",
							   "iPhone XR",
							   "iPhone XS",
							   "iPhone XS Max"];
		return elongationPhone.contains(modelName)
	}
	
	static var modelName: String {
		var systemInfo = utsname()
		uname(&systemInfo)
		let machineMirror = Mirror(reflecting: systemInfo.machine)
		let identifier = machineMirror.children.reduce("") { identifier, element in
			guard let value = element.value as? Int8, value != 0 else { return identifier }
			return identifier + String(UnicodeScalar(UInt8(value)))
		}
		
		switch identifier {
		case "iPod1,1":                                return "iPod Touch 1"
		case "iPod2,1":                                return "iPod Touch 2"
		case "iPod3,1":                                return "iPod Touch 3"
		case "iPod4,1":                                return "iPod Touch 4"
		case "iPod5,1":                                return "iPod Touch (5 Gen)"
		case "iPod7,1":                                return "iPod Touch 6"
		case "iPhone3,1", "iPhone3,2", "iPhone3,3":    return "iPhone 4"
		case "iPhone4,1":                              return "iPhone 4s"
		case "iPhone5,1":                              return "iPhone 5"
		case "iPhone5,2":                              return "iPhone 5 (GSM+CDMA)"
		case "iPhone5,3":                              return "iPhone 5c (GSM)"
		case "iPhone5,4":                              return "iPhone 5c (GSM+CDMA)"
		case "iPhone6,1":                              return "iPhone 5s (GSM)"
		case "iPhone6,2":                              return "iPhone 5s (GSM+CDMA)"
		case "iPhone7,2":                              return "iPhone 6"
		case "iPhone7,1":                              return "iPhone 6 Plus"
		case "iPhone8,1":                              return "iPhone 6s"
		case "iPhone8,2":                              return "iPhone 6s Plus"
		case "iPhone8,4":                              return "iPhone SE"
		case "iPhone9,1":                              return "国行、日版、港行iPhone 7"
		case "iPhone9,2":                              return "港行、国行iPhone 7 Plus"
		case "iPhone9,3":                              return "美版、台版iPhone 7"
		case "iPhone9,4":                              return "美版、台版iPhone 7 Plus"
		case "iPhone10,1","iPhone10,4":                return "iPhone 8"
		case "iPhone10,2","iPhone10,5":                return "iPhone 8 Plus"
		case "iPhone10,3","iPhone10,6":                return "iPhone X"
		case "iPhone11,8":                             return "iPhone XR"
		case "iPhone11,2":                             return "iPhone XS"
		case "iPhone11,4","iPhone11,6":                return "iPhone XS Max"
			
			
		case "iPad1,1":                                           return "iPad"
		case "iPad1,2":                                           return "iPad 3G"
		case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":          return "iPad 2"
		case "iPad2,5", "iPad2,6", "iPad2,7":                     return "iPad Mini"
		case "iPad3,1", "iPad3,2", "iPad3,3":                     return "iPad 3"
		case "iPad3,4", "iPad3,5", "iPad3,6":                     return "iPad 4"
		case "iPad4,1", "iPad4,2", "iPad4,3":                     return "iPad Air"
		case "iPad4,4", "iPad4,5", "iPad4,6":                     return "iPad Mini 2"
		case "iPad4,7", "iPad4,8", "iPad4,9":                     return "iPad Mini 3"
		case "iPad5,1", "iPad5,2":                                return "iPad Mini 4"
		case "iPad5,3", "iPad5,4":                                return "iPad Air 2"
		case "iPad6,3", "iPad6,4":                                return "iPad Pro 9.7"
		case "iPad6,7", "iPad6,8":                                return "iPad Pro 12.9"
		case "AppleTV2,1":                                        return "Apple TV 2"
		case "AppleTV3,1","AppleTV3,2":                           return "Apple TV 3"
		case "AppleTV5,3":                                        return "Apple TV 4"
		case "i386", "x86_64":                                    return "Simulator"
		default:  return identifier
		}
	}
}

