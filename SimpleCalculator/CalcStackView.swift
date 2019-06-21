//
//  CalcStackView.swift
//  SimpleCalculator
//
//  Created by Min Kyeong Tae on 21/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

class CalcView: UIView {
    
    let backgroundView: UIView = {
       let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        backgroundView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return backgroundView
    }()
    
    let calcTextField: UITextField = {
        let calcTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        calcTextField.keyboardType = .numberPad
        calcTextField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        calcTextField.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        calcTextField.autocorrectionType = .no
        calcTextField.font = UIFont(name: "HelveticaNeue-Thin", size: 60)
        calcTextField.adjustsFontSizeToFitWidth = true
        return calcTextField
    }()
    
    let plusButton: UIButton = {
        let plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        plusButton.setTitle("＋", for: .normal)
        plusButton.tag = 1
        return plusButton
    }()
    
    let minusButton: UIButton = {
        let minusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        minusButton.setTitle("－", for: .normal)
        minusButton.tag = 2
        return minusButton
    }()
    
    let divButton: UIButton = {
        let divButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        divButton.setTitle("/", for: .normal)
        divButton.tag = 3
        return divButton
    }()
    
    let mulButton: UIButton = {
        let plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        plusButton.setTitle("X", for: .normal)
        plusButton.tag = 4
        return plusButton
    }()
    
    let resultButton: UIButton = {
        let resultButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        resultButton.setTitle("calculate", for: .normal)
        resultButton.tag = 5
        return resultButton
    }()
    
    var calcStackView = UIStackView()
    
    // MARK:- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCalcStackView()
        setSubviews()
        setConstraints()
        setButtonAttributes()
        backgroundView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK:- Setting Methods
    func setButtonAttributes() {
        setButtonAttribute(calcButton: plusButton)
        setButtonAttribute(calcButton: minusButton)
        setButtonAttribute(calcButton: divButton)
        setButtonAttribute(calcButton: mulButton)
        setButtonAttribute(calcButton: resultButton)
    }
    func setButtonAttribute(calcButton: UIButton) {
        calcButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 50)
        calcButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        calcButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        calcButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        calcButton.contentVerticalAlignment = .center
        calcButton.contentHorizontalAlignment = .center
        calcButton.isUserInteractionEnabled = true
    }
    func setConstraints() {
        self.calcStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            calcStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            calcStackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30),
            calcStackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30)
            ])
        
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor)
            ])
    }
    
    func setCalcStackView() {
        calcStackView = UIStackView(arrangedSubviews: [calcTextField, plusButton, minusButton, divButton, mulButton, resultButton])
        calcStackView.distribution = .fillEqually
        calcStackView.axis = .vertical
        calcStackView.spacing = 6
        calcStackView.isUserInteractionEnabled = true
    }
    
    func setSubviews() {
        self.backgroundView.addSubview(calcStackView)
        addSubview(backgroundView)
    }
}
