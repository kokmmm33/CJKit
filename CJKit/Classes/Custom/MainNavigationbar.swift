//
//  MainNavigationbar.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/29.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import UIKit
import SnapKit

class MainNavigationbar: UIView {
	fileprivate let x: CGFloat = 0
	fileprivate let y: CGFloat = UIScreen.statusBarHeitht
	fileprivate let w: CGFloat = UIScreen.screenWidth
	fileprivate let h: CGFloat = 0
	
    let leftButton = UIButton(type: .custom)
    let rightButton = UIButton(type: .custom)
    fileprivate let titleView = UIView()
    let titleLabel = UILabel()
    let separeLine = UIView()
    var showLine : Bool = true {
        didSet {
            separeLine.isHidden = !showLine
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: x,y: y,width: w,height: h))
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainNavigationbar {
    fileprivate func setupUI() {
        backgroundColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = UIColor.black
        separeLine.backgroundColor = UIColor(hex: 0xe6e6e6)
        leftButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        leftButton.setImage(#imageLiteral(resourceName: "nav_back_back"), for: .normal)
        leftButton.adjustsImageWhenHighlighted = false
        rightButton.adjustsImageWhenHighlighted = false
        addSubview(rightButton)
        addSubview(leftButton)
        addSubview(titleLabel)
        addSubview(separeLine)
        leftButton.snp.makeConstraints { (make) in
            make.leading.equalTo(10)
            make.centerY.equalTo(h * 0.5)
        }

        rightButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-15)
            make.centerY.equalTo(h * 0.5)
            make.width.height.equalTo(h)
        }

        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(h * 0.5)
            make.width.equalTo(w * 0.5)
        }

        separeLine.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
    }
}

extension MainNavigationbar {
    @objc fileprivate func popViewController() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
}

