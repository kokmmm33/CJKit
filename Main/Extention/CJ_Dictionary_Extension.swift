//
//  CJ_Dictionary_Extension.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/23.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /// 将Dictionary对象转换成String
    ///
    /// - Returns: 解析后的字符串
    func getJSONString() -> String {
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try! JSONSerialization.data(withJSONObject: self, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }

}
