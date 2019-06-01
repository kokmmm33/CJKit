//
//  Urls.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/5/21.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import UIKit

enum EnvType {
	case develop
	case release
	case debug
}

class Server {
	fileprivate static let currentEnv = EnvType.develop
	static func currentServer() -> String {
		switch currentEnv {
		case .release:
			return "http://sgmt.xianfengsg.com"
		default:
			return "http://192.168.1.117:8088"
		}
	}
}

class Paths {
	static let sendMsg = "/BillingHelper-server/sys/sendSms"
	static let login = "/BillingHelper-server/sys/login"
	// 首页收入报表
	static let report = "/BillingHelper-server/report/statistics"
}
