//  0
//  AppDelegate.swift
//  SimpleCalculator
//
//  Created by Min Kyeong Tae on 21/06/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 스크린 크기만큼 윈도우 창을 띄우도록 설정한다.
        window = UIWindow(frame: UIScreen.main.bounds)

        // 첫 화면이 될 계산화면, calcViewController
        let calcViewController = CalcViewController()

        // 첫 화면이 imbeded되는 네비게이션컨트롤러, calcNavigationController(rootViewController -> calcViewController)
        let calcNavigationController = CalcNavigationController(rootViewController: calcViewController)

        // 계산기의 첫 화면을 설정한다.
        window?.rootViewController = calcNavigationController

        return true
    }
}
