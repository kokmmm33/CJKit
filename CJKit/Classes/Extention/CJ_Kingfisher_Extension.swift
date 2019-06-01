//
//  CJ_UIImageView_Extension.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/15.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import Foundation
import Kingfisher
extension UIImageView {
    public func cj_setImage(_ urlStr : String?, _ pleaseholder : UIImage? = nil) {
        guard let urlStr = urlStr else {
            return
        }
        guard let url = URL(string: urlStr) else {
            return
        }
        self.kf.setImage(with: url, placeholder: pleaseholder, options: nil, progressBlock: nil, completionHandler: nil)
    }
}

extension UIButton {
    public func cj_setImage(_ urlStr : String?, _ pleaseholder : UIImage? = nil, for state: UIControl.State) {
        guard let urlStr = urlStr else {
            return
        }
        guard let url = URL(string: urlStr) else {
            return
        }
        self.kf.setBackgroundImage(with: url, for: state)
    }
}
