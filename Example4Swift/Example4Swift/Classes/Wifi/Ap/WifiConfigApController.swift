//
//  WifiConfigApController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/10/19.
//

import UIKit
import BVCommon
import CoreLocation

class WifiConfigApController: UIViewController {

    @IBOutlet weak var qrCodeTF: UITextField!
    @IBOutlet weak var ssidTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var currentSsid: UILabel!
    
    var apConfiger: BVApConfiger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Ap配网"
        
        currentSsid.text = ""
    }
    
    deinit {
        apConfiger?.stop()
    }
}

extension WifiConfigApController {
    /// 点击开始配网
    @IBAction func clickConfig() {
        let qrCode = self.qrCodeTF.text!
        BVWifiConfigManager.shared.startConfig(qrCode: qrCode) { [weak self] config in
            if config != nil {
                self?.startConfig(config: config!)
            }
        }
    }
    
    func startConfig(config: BVDeviceWifiConfig) {
        let ssid = self.ssidTF.text!
        let pwd = self.passwordTF.text!
        
        self.apConfiger = BVApConfiger.init(ssid: ssid, password: pwd, config: config, delegate: self)
        
        BVLocationPermissionManager.shared.needLocationTodo(delegate: self) { [weak self] in
            self?.begin()
        }
    }
    
    func begin() {
        BVHUD.showInfo("到设置中连接扫地机的wifi")
        apConfiger?.start()
    }
}

extension WifiConfigApController: BVWifiConfigLocationListener {
    func noLocationService() {
        BVHUD.showInfo("到设置中打开位置服务")
    }
    
    func noLocationPermission() {
        BVHUD.showInfo("到设置中打开位置权限")
    }
}

extension WifiConfigApController: BVWifiApConfigListener {
    func didConnectToDevice() {
        BVHUD.showInfo("连接到设备")
    }
    
    func didSendWifiInfo() {
        BVHUD.showInfo("已发送配网信息")
    }
    
    func didConfigWifiSuccess() {
        BVHUD.showInfo("配网成功")
    }
    
    func didConfigWifiFail(error: BVError) {
        BVHUD.showInfo("配网失败")
    }
}
