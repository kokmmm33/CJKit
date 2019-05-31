//
//  Plugins.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/5/25.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import Foundation
import Moya
import Result

class MainPlugin: PluginType {
	
	func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
		var req = request
		let token = AppManager.shareManager.token
		if !token.isEmpty {
			req.addValue(token, forHTTPHeaderField: "token")
		}
		return req
	}
	
	func willSend(_ request: RequestType, target: TargetType) {
		cLog("***********开始请求**********")
		if let request = request.request?.description {
			cLog("request:\n\(request)")
		}
		if let headers = request.request?.allHTTPHeaderFields {
			cLog("headers:\n\(headers)")
		}
		if let bodyData = request.request?.httpBody {
			let body = String(data: bodyData, encoding: String.Encoding.utf8) ?? ""
			cLog("body:\n\(body)")
		}
	}
}
