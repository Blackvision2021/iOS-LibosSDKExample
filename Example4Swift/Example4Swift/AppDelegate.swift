//
//  AppDelegate.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/9/16.
//

import UIKit
import BVCommon
import IQKeyboardManagerSwift
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    class var `default`: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        initsdk()
        
        enterLogin()
        
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func initsdk() {
        BVClient.setDebugMode(debug: true)
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }

    func enterLogin() {
        window?.rootViewController = BVLoginController.init()
    }
    
    func enterApp() {
        let nav = UINavigationController.init(rootViewController: ViewController.init())
        window?.rootViewController = nav
    }
}

