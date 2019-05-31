//
//  Serve.swift
//  XFCashier
//
//  Created by 蔡杰 on 2019/3/4.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import Foundation
import Moya

public enum BaseService {
	case sendMsg(tel: String)
	case login(tel: String, code: String)
	case report(isPerson: String, clientId: String)
	case other
	
}

extension BaseService: TargetType {
    public var baseURL: URL {
        return URL(string: Server.currentServer())!
    }
    
    public var path: String {
		switch self {
		case .sendMsg:
			return Paths.sendMsg
		
		case .login:
			return Paths.login
		
		case .report:
			return Paths.report
			
		default:
			return ""
		}
    }
    
    public var task: Task {
		switch self {
		case .sendMsg(let tel):
			let params = ["mobile": tel]
			return .requestParameters(parameters: params, encoding: JSONEncoding.default)
			
		case .login(let tel, let code):
			let params = ["mobile": tel, "captcha": code, "isApp": "1"]
			return .requestParameters(parameters: params, encoding: JSONEncoding.default)
			
		case .report(let isPerson, let clientId):
			let params = ["isPersonal": isPerson, "clientId": clientId]
			
			return .requestParameters(parameters: params, encoding: URLEncoding.default)
			
		default:
			return .requestPlain
		}
    }
	
	public var method: Moya.Method {
		switch self {
		case .sendMsg, .login:
			return .post
			
		default:
			return .get
		}
	}
    
    public var headers: [String : String]? {
        return nil
    }
	
	public var sampleData: Data {
		return "{}".data(using: String.Encoding.utf8)!
	}
}

