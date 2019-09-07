//
//  UIStackView+.swift
//  SimpleCalculator
//
//  Created by MinKyeongTae on 08/09/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(view: UIView...) {
        view.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
