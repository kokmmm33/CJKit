//
//  CJ_String_Extension.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/14.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    var MD5: String {
        let cStr = self.cString(using: .utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString()
        for i in 0..<16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    /// 判断手机号是否合法
    public func isOnePhone () -> Bool {
        let pattern2 = "^1[0-9]{10}$"
        if NSPredicate(format: "SELF MATCHES %@", pattern2).evaluate(with: self) {
            return true
        }
        return false
    }
    /// 将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
    
    /// 将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    static func convertDate(_ timeStamp : Double, _ format : String = "yyyy-MM-dd HH:mm:ss") -> String {
        if "\(timeStamp)".count < 10 {
            assertionFailure("时间戳格式错误")
            return ""
        }
        //转换为时间
        let timeInterval:TimeInterval = timeStamp
        let date = Date(timeIntervalSince1970: timeInterval)
        //格式话输出
        let dformatter = DateFormatter()
        //dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        dformatter.dateFormat = format
        let result = "\(dformatter.string(from: date))"
        print("对应的日期时间：\(result)")
        return result
    }
}

extension String {
    /// range转换为NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    /// NSRange转化为range
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    
    // 在字符串中查找另一字符串首次出现的位置（或最后一次出现位置）
    ///（如果backwards参数设置为true，则返回最后出现的位置）
    func cj_positionOf(sub:String, backwards:Bool = false)->Int {
        // 如果没有找到就返回-1
        var pos = -1
        if let range = range(of:sub, options: backwards ? .backwards : .literal ) {
            if !range.isEmpty {
                pos = self.distance(from:startIndex, to:range.lowerBound)
            }
        }
        return pos
    }
    
    /// 使用下标截取字符串 例: "示例字符串"[0..<2] 结果是 "示例"
    subscript (r: Range<Int>) -> String {
        get {
            if (r.lowerBound > count) || (r.upperBound > count) { return "" }
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }

    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
    func cj_stringCut(end: Int) ->String{
        
        if !(end < self.count) { return self }
        let sInde = index(startIndex, offsetBy: end)
        return String(self[...sInde])
    }
    
    /// 截取第任意位置到结束
    ///
    /// - Parameter end:
    /// - Returns: 截取后的字符串
    func cj_stringCutToEnd(start: Int) -> String {
        if !(start < count) { return self }
        let sRang = index(startIndex, offsetBy: start)
        //return substring(with: sRang)
        return String(self[sRang...])
    }

    /// 字符串任意位置插入
    ///
    /// - Parameters:
    ///   - content: 插入内容
    ///   - locat: 插入的位置
    /// - Returns: 添加后的字符串
    func cj_stringInsert(content: String,locat: Int) -> String {
        if !(locat < count) { return self }
        let str1 = cj_stringCut(end: locat)
        let str2 = cj_stringCutToEnd(start: locat+1)
        return str1 + content + str2
    }

}
