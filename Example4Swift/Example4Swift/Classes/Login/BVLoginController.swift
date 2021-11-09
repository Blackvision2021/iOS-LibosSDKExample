//
//  BVLoginController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/10/13.
//

import UIKit
import BVCommon

class BVLoginController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var appIdTF: UITextField!
    @IBOutlet weak var appSecretTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("销毁")
    }
    
}

extension BVLoginController {
    @IBAction func clickLogin() {
        let userName = userNameTF.text!
        let appId = appIdTF.text!
        let secret = appSecretTF.text!
        guard userName.count > 0 && appId.count > 0 && secret.count > 0 else {
            BVHUD.showInfo("请先填充内容")
            return
        }
        BVHUD.showLoading("正在登录")
        BVClient.initSdk(appId, secret)
        BVClient.shared.login(account: userName, region: .dev) { result in
            if result {
                print("跳转")
                AppDelegate.default.enterApp()
            }
            BVHUD.dismiss()
        }
    }
    
    @IBAction func clickTest() {

    }
}
