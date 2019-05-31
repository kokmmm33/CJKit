//
//  CJ_commonTool.swift
//  XFCashier
//
//  Created by 蔡杰 on 2019/3/5.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import UIKit

func cLog<T>(_ message: T) {
    #if DEBUG
    print(message)
    #endif
}
