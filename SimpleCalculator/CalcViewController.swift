//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Min Kyeong Tae on 21/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

enum CalcButtonTag: Int {
    case plus = 1
    case minus = 2
    case div = 3
    case mul = 4
    case result = 5
}

class CalcViewController: UIViewController {
    
    var resultValue: Int = 0
    var calcOption: Int = 0
    var calcValue: Int = 0
    
    let calcView: CalcView = {
        let calcView = CalcView()
        return calcView
    }()
    
    lazy var viewTapGestureRecognizer: UITapGestureRecognizer = {
        let viewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewPressed(_:)))
        return viewTapGestureRecognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calcView.plusButton.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
        calcView.minusButton.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
        calcView.divButton.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
        calcView.mulButton.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
        calcView.resultButton.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(viewTapGestureRecognizer)
        self.calcView.calcTextField.delegate = self
    }
    
    override func loadView() {
        self.view = calcView
    }
    
    func calculateValue() {
        guard let beforeCalcTag = CalcButtonTag(rawValue: calcOption) else { return }
        switch beforeCalcTag {
        case .plus:
            resultValue += calcValue
        case .minus:
            resultValue -= calcValue
        case .div:
            if calcValue==0 { break }
            resultValue /= calcValue
        case .mul:
            resultValue *= calcValue
        case .result:
            break
        }
        calcValue = 0
    }
    
    @objc func calcButtonPressed(_ sender: UIButton) {
        if calcView.calcTextField.text == "" { calcView.calcTextField.text = "0" }
        guard let calcButtonTag = CalcButtonTag(rawValue: sender.tag),
            let value = calcView.calcTextField.text,
            let subValue = Int(value) else { return }
        
        if resultValue == 0 {
            self.resultValue = subValue
            calcValue = 0
        } else {
            self.calcValue = subValue
            calculateValue()
        }

        switch calcButtonTag {
        case .plus:
            calcOption = calcButtonTag.rawValue
//            calcView.calcTextField.text = "+"
        case .minus:
            calcOption = calcButtonTag.rawValue
//            calcView.calcTextField.text = "-"
        case .div:
            calcOption = calcButtonTag.rawValue
//            calcView.calcTextField.text = "/"
        case .mul:
            calcOption = calcButtonTag.rawValue
//            calcView.calcTextField.text = "*"
        case .result:
            calcView.calcTextField.text = "\(resultValue)"
            calcView.calcTextField.placeholder = ""
            resultValue = 0
            calcValue = 0
            return
        }
        calcView.calcTextField.placeholder = "\(resultValue)"
        calcView.calcTextField.text = ""
    }
    
    @objc func mainViewPressed(_ sender: UIButton) {
        self.view.endEditing(true)
    }
}

extension CalcViewController: UITextFieldDelegate {

}
