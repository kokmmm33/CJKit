//
//  BaseResponse.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/5/21.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import UIKit


class BaseResponse<T: HandyJSON>: HandyJSON {
	required init() {}
	
	var code: Int = -1
	var msg: String?
	var server_time: Double?
	var data: T?
}
