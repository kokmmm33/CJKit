//
//  AppManager.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/5/21.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import UIKit

class AppManager: NSObject {
	static let shareManager = AppManager()
	static let keyWindow = UIApplication.shared.keyWindow!

	lazy var loginInfo: XFLoginInfoModel? = {
		let info = DataManager.decodeData(XFLoginInfoModel.self, from: DataManager.pathForLoginInfo)
		return info
	}()
	
	var token: String {
		let token = self.loginInfo?.tokenEntity?.token ?? ""
		return token
	}
	
	var isLogin: Bool {
		return !token.isEmpty
	}

}
