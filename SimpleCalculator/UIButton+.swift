//
//  UIButton+.swift
//  SimpleCalculator
//
//  Created by MinKyeongTae on 08/09/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

extension UIButton {
    func makeDefaultButton(title: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont().mainFont(size: 50)
        button.setTitleColor(MainColor.calcText, for: .normal)
        button.backgroundColor = MainColor.buttonBackground
        button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.isUserInteractionEnabled = true
        return button
    }
}
