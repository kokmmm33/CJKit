//
//  Network.swift
//  XFCashier
//
//  Created by 蔡杰 on 2019/3/4.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

typealias ResponseHandle = (JSON) -> Void

class Network {
	fileprivate static let provider = MoyaProvider<MultiTarget>(plugins: [MainPlugin()])
    
    static func request(_ target: TargetType,  completion: @escaping ResponseHandle) {
        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let res):
                do {
                    // 过滤相应成功的状态 200
                    let sucessRes = try res.filterSuccessfulStatusCodes()
                    let data = try? sucessRes.mapJSON()
                    let json = JSON(data!)
					cLog("******请求成功******")
					cLog(json)
                    completion(json)
                }catch {
                    // 响应失败
					let data = try? res.mapJSON()
					let json = JSON(data!)
					cLog("******请求失败******")
					cLog(json)
                }
                break
            case .failure(let err):
                let e = err.localizedDescription
                cLog("******请求错误******")
                cLog(e)
                break
            }
        }
    }
    
}
