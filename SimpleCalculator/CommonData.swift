//
//  CommonData.swift
//  SimpleCalculator
//
//  Created by Min Kyeong Tae on 22/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

// MARK: - Calculator Button Tags

public let buttonStartTag = 100

public enum CalcButtonTag: Int {
    case clear = 100
    case plus = 101
    case minus = 102
    case div = 103
    case mul = 104
    case result = 105
}

public enum Color {
    static let mainBackground: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    static let calcBackground: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    static let buttonBackground: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    static let calcText: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let navigationBarBackground: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
}

extension UIFont {
    func mainFont(size: CGFloat) -> UIFont {
        guard let mainFont = UIFont(name: "HelveticaNeue-Thin", size: size) else { return UIFont() }
        return mainFont
    }
}

extension UIButton {
    func makeDefaultButton(title: String) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont().mainFont(size: 50)
        button.setTitleColor(Color.calcText, for: .normal)
        button.backgroundColor = Color.buttonBackground
        button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .center
        button.isUserInteractionEnabled = true
        return button
    }
}

extension UIStackView {
    func addArrangedSubviews(view: UIView...) {
        view.forEach { view in
            self.addArrangedSubview(view)
        }
    }
}
