//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Min Kyeong Tae on 21/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

/// MARK:- 계산기능을 하는 뷰 컨트롤러
class CalcViewController: UIViewController {
    
    // MARK:- Properties
    private var resultValue: Double = 0
    private var calcOption: Int = 0
    private var calcValue: Double = 0
    
    // MARK:- UI Objects
    private let calcView: CalcView = {
        let calcView = CalcView()
        return calcView
    }()
    
    private lazy var viewTapGestureRecognizer: UITapGestureRecognizer = {
        let viewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(mainViewPressed(_:)))
        return viewTapGestureRecognizer
    }()
    
    // MARK:- Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addButtonTarget()
        self.view.addGestureRecognizer(viewTapGestureRecognizer)
        self.calcView.calcTextField.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        self.view = calcView
    }
    
    // MARK:- Setting Methods
    // MARK:- Setting Methods
    func addButtonTarget() {
        for i in 100..<106 {
            guard let button = view.viewWithTag(i) as? UIButton else { continue }
            button.addTarget(self, action: #selector(calcButtonPressed(_:)), for: .touchUpInside)
        }
    }
    
    func showAlertController() {
        let alertController = UIAlertController(title: "0으로 나눌 수 없음", message: "다른 값을 입력해주세요!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "네.. ㅠ_ㅠ..", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    
    /// MARK: 계산기 연산 메서드
    func calculateValue() {
        // 최근 터치한 연산버튼의 바로 이전까지의 연산을 진행한다.
        guard let beforeCalcTag = CalcButtonTag(rawValue: calcOption) else { return }
        switch beforeCalcTag {
        case .plus:
            resultValue += calcValue
        case .minus:
            resultValue -= calcValue
        case .div:
            // 나머지는 0으로 나눌 시 AlertController를 작동시킨다.
            if calcValue == 0 {
                showAlertController()
                break
            }
            resultValue /= calcValue
        case .mul:
            resultValue *= calcValue
        case .clear: break
        case .result: break
        }
        calcValue = 0
    }
    
    /// MARK:- 계산기 버튼 터치이벤트 메서드
    ///
    /// - Parameter sender: 터치한 계산버튼에 따른 이벤트 메서드
    @objc func calcButtonPressed(_ sender: UIButton) {
        self.view.endEditing(true)
        // 값이 비어있을 경우 0으로 치환하여 계산한다.
        if calcView.calcTextField.text == "" { calcView.calcTextField.text = "0" }
        // 터치한 버튼 태그를 확인한다.
        guard let calcButtonTag = CalcButtonTag(rawValue: sender.tag),
            let value = calcView.calcTextField.text,
            let subValue = Double(value) else { return }
        
        // 연산결과가 아직 0인경우 최근 입력값을 연산결과값으로 설정한다.
        if resultValue == 0 {
            self.resultValue = subValue
            calcValue = 0
            // 연산결과가 존재하면, 최근 입력값을 추가 계산값으로 설정한다.
        } else {
            self.calcValue = subValue
            // 해당 연산버튼 이전까지의 결과값을 계산한다.
            calculateValue()
        }
        
        switch calcButtonTag {
        case .clear:
            resultValue = 0
            calcValue = 0
        case .plus:
            calcOption = calcButtonTag.rawValue
        case .minus:
            calcOption = calcButtonTag.rawValue
        case .div:
            calcOption = calcButtonTag.rawValue
        case .mul:
            calcOption = calcButtonTag.rawValue
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
    //
}

