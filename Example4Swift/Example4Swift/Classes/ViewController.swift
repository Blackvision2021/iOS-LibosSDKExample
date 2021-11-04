//
//  ViewController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/9/16.
//

import UIKit
import BVCommon
import BVSweeperKit

class Moudle: NSObject {
    var group: String = ""
    var list: [String] = []
    
    init(group: String) {
        super.init()
        self.group = group
    }
}

class ViewController: UIViewController {
    var data: [Moudle] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.initView()
    }
}

extension ViewController {
    func initData() {
        let wifi = Moudle.init(group: "配网")
        wifi.list.append("Ap配网")
        wifi.list.append("蓝牙配网")
        wifi.list.append("4G配网")
        wifi.list.append("扫码配网")
        data.append(wifi)
        
        let device = Moudle.init(group: "设备")
        device.list.append("设备列表")
        data.append(device)
        
        let map = Moudle.init(group: "地图控件")
        map.list.append("地图显示")
        map.list.append("禁区、虚拟墙")
        map.list.append("划区")
        map.list.append("房间编辑")
        map.list.append("分享地图模式")
        map.list.append("预览地图模式")
        data.append(map)
        
        // 初始化地图样式
        BVSweeperMapConfig.shared.robotIcon = UIImage.init(named: "icon_扫地机")
        BVSweeperMapConfig.shared.chargingIcon = UIImage.init(named: "iocn_充电座")
        BVSweeperMapConfig.shared.deleteIcon = UIImage.init(named: "icon_删除")
        BVSweeperMapConfig.shared.adjustIcon = UIImage.init(named: "icon_调整大小")
    }
    
    func initView() {
        self.navigationItem.title = "libos-sdk"
        self.view.backgroundColor = .white
        
        let tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 44
        self.view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data[section].list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        cell?.selectionStyle = .none
        cell?.accessoryType = .disclosureIndicator
        if #available(iOS 14.0, *) {
            var content = cell?.defaultContentConfiguration()
            content?.text = self.data[indexPath.section].list[indexPath.row]
            cell?.contentConfiguration = content
        } else {
            cell?.textLabel?.text = self.data[indexPath.section].list[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.data[section].group
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController? = nil
        if indexPath.section == 0 {
            // 配网
            switch indexPath.row {
            case 0:
                vc = WifiConfigApController.init()
            case 1:
                return
            case 2:
                return
            case 3:
                return
            default:
                print("none")
            }
        } else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                vc = BVMapController.init()
            case 1:
                vc = BVForbiddenController.init()
            case 2:
                vc = BVAreaController.init()
            case 3:
                vc = BVRoomController.init()
            case 4:
                vc = BVShareMapController.init()
            case 5:
                vc = BVPreViewMapController.init()
            default:
                print("none")
            }
        }
        if vc != nil { self.navigationController?.pushViewController(vc!, animated: true) }
    }
}
