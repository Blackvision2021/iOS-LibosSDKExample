//
//  BVMapController.swift
//  Libos
//
//  Created by 田宇 on 2021/10/28.
//

import UIKit
import BVSweeperKit

class BVMapController: UIViewController {
    
    var mapView: BVSweeperMapView!
    var logView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    deinit {
        print("销毁")
    }
    
    
}

@objc extension BVMapController {
    
    func getNavTitle() -> String {
        return "地图显示"
    }
    
    func getMapMode() -> BVSweeperMapViewMode {
        .normalMode
    }
    
    func initView() {
        self.navigationItem.title = getNavTitle()
        
        self.view.backgroundColor = .secondarySystemBackground
        
        let emptyView = UIView.init()
        emptyView.backgroundColor = .red
        
        let mode = getMapMode()
        
        let height = AppDelegate.default.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 20
        
        mapView = BVSweeperMapView.init(mode: mode, emptyView: emptyView)
        mapView.backgroundColor = .systemGray
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(height)
            make.height.equalTo(500)
        }
        
        logView = UITextView.init()
        logView.isEditable = false
        self.view.addSubview(logView)
        logView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(mapView.snp.bottom)
            make.height.equalTo(150)
        }
        
        if let data = BVRegular.loadData() {
            if let mapData = BVSweeperMapData.modelWith(data: data) {
                self.mapView.reciveMapData(mapData)
            }
        }
    }
    
    func log(_ msg: String) {
        var text = self.logView.text
        text?.append("\n")
        text?.append(msg)
        self.logView.text = text
    }
}
