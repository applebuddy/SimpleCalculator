//
//  CalcStackView.swift
//  SimpleCalculator
//
//  Created by Min Kyeong Tae on 21/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

// MARK: - Calculating function View

class CalculatorView: UIView {
    // MARK: - UI

    private let backgroundView: UIView = {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        backgroundView.backgroundColor = MainColor.mainBackground
        return backgroundView
    }()

    let calcTextField: UITextField = {
        let calcTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        calcTextField.keyboardType = UIKeyboardType.decimalPad
        calcTextField.textColor = MainColor.calcText
        calcTextField.backgroundColor = MainColor.calcBackground
        calcTextField.autocorrectionType = .no
        calcTextField.font = UIFont().mainFont(size: 60)
        calcTextField.adjustsFontSizeToFitWidth = true
        return calcTextField
    }()

    let plusButton: UIButton = {
        let plusButton = UIButton().makeDefaultButton(title: "＋")
        plusButton.tag = 101
        return plusButton
    }()

    let minusButton: UIButton = {
        let minusButton = UIButton().makeDefaultButton(title: "－")
        minusButton.tag = 102
        return minusButton
    }()

    let divButton: UIButton = {
        let divButton = UIButton().makeDefaultButton(title: "/")
        divButton.tag = 103
        return divButton
    }()

    let mulButton: UIButton = {
        let plusButton = UIButton().makeDefaultButton(title: "X")
        plusButton.tag = 104
        return plusButton
    }()

    let clearButton: UIButton = {
        let clearButton = UIButton().makeDefaultButton(title: "Clear")
        clearButton.tag = 100
        return clearButton
    }()

    let resultButton: UIButton = {
        let resultButton = UIButton().makeDefaultButton(title: "Calculator")
        resultButton.tag = 105
        return resultButton
    }()

    private var calcStackView: UIStackView = {
        let calcStackView = UIStackView()
        calcStackView.isUserInteractionEnabled = true
        return calcStackView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCalcStackView()
        setSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Method

    // MARK: Setting

    private func setCalcStackView() {
        calcStackView = UIStackView(arrangedSubviews: [resultButton, plusButton, minusButton, divButton, mulButton, clearButton, calcTextField])
        calcStackView.distribution = .fillEqually
        calcStackView.spacing = 6
        calcStackView.axis = .vertical
    }

    private func setSubviews() {
        calcStackView.addArrangedSubviews(view: calcTextField, plusButton, minusButton, divButton, mulButton, clearButton, resultButton)
        backgroundView.addSubview(calcStackView)
        addSubview(backgroundView)
    }

    private func setConstraints() {
        calcStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            calcStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            calcStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30),
            calcStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30),
        ])

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
        ])
    }
}
