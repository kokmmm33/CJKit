//
//  MainTabbar.swift
//  CashierHelper
//
//  Created by 蔡杰 on 2019/3/5.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import UIKit

class MainTabbar: UITabBar {
	lazy var centerButton : UIButton = {
		let bt = UIButton(type: .custom)
		bt.setBackgroundImage(#imageLiteral(resourceName: "开单"), for: .normal)
		bt.setTitle("开单", for: .normal)
		bt.titleLabel?.font = UIFont.systemFont(ofSize: 13)
		bt.titleEdgeInsets = UIEdgeInsets(top: 23, left: 0, bottom: 0, right: 0)
		bt.bounds = CGRect(x: 0, y: 0, width: 51, height: 47)
		bt.center = CGPoint(x: self.cj_width*0.5, y: self.cj_height*0.5 - 5)
		return bt
	}()
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		tintColor = UIColor(hex: 0x333333)
		addSubview(self.centerButton)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
