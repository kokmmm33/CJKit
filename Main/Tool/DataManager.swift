//
//  DataManager.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/5/22.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import Foundation

class DataManager {

	
   /// 将对象序列化，并保存到指定位置
   ///
   /// - Parameters:
   ///   - object: 需要序列化的对象
   ///   - path: 保存的路径
   static func encodeData<T>(object: T, path: String) where T : Encodable {
		let encoder = JSONEncoder()
		let encoded = try? encoder.encode(object)
		if let data = encoded {
			cLog("write data into " + path)
			let bool = NSKeyedArchiver.archiveRootObject(data, toFile: path)
			if bool {
				cLog("归档成功")
			}else {
				cLog("归档失败")
			}
		}
	}
	
	
	/// 从指定路径解档对象
	///
	/// - Parameters:
	///   - type: 解档的目标对象
	///   - path: 解档对象所在路径
	/// - Returns: 返回已解档对象
	static func decodeData<T>(_ type: T.Type, from path: String) -> T? where T : Decodable {
		let encoded = NSKeyedUnarchiver.unarchiveObject(withFile: path)
		if let e = encoded {
			let decoder = JSONDecoder()
			do {
				let object = try decoder.decode(type, from: e as! Data)
				cLog("解档成功")
				return object
			}catch {
				cLog(error.localizedDescription)
				return nil
			}
		}else{
			return nil
		}
	}
	
	/// 根据文件名获取沙盒中对应的文件路径
	///
	/// - Parameter fileName: 文件名
	/// - Returns: 文件名在沙盒中的路径
	private static func getFilePathInDocument(fileName: String) -> String {
		return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/\(fileName)"
	}
}

extension DataManager {
	/// 登陆信息
	static let pathForLoginInfo =  getFilePathInDocument(fileName: "loginInfo")
	
	

}
