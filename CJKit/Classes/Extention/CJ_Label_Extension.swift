//
//  CJ_Label_Extension.swift
//  EvaluationComing
//
//  Created by 蔡杰 on 2018/8/14.
//  Copyright © 2018年 Joseph. All rights reserved.
//

import UIKit

extension UILabel {
    public func setup(font : UIFont, textColor : UIColor? = UIColor.yellow, text : String? = "label") {
        self.font = font
        self.textColor = textColor
        self.text = text
    }
}
