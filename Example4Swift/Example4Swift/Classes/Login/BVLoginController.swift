//
//  BVLoginController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/10/13.
//

import UIKit
import BVCommon

class BVLoginController: BVBaseController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var appIdTF: UITextField!
    @IBOutlet weak var appSecretTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        BVClient.shared.loginDelegate = self
        BVClient.shared.login(account: userName, region: .dev)
    }
    
    @IBAction func clickTest() {

    }
}

// MARK: - BVClientLoginDelegate
extension BVLoginController: BVClientLoginDelegate {
    func bvClientLoginSuccess() {
        AppDelegate.default.enterApp()
        BVHUD.dismiss()
    }
    
    func bvClientLoginFailWith(error: BVError) {
        print("登录失败：\(error)")
        BVHUD.showInfo("登录失败")
        BVHUD.dismiss()
    }
}
