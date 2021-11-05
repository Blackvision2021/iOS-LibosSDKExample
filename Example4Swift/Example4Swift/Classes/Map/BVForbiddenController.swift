//
//  BVForbiddenController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/11/1.
//

import UIKit

class BVForbiddenController: BVMapController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BVForbiddenController {
    override func getNavTitle() -> String {
        return "禁区、虚拟墙"
    }
    
    override func initView() {
        super.initView()
        
        self.mapView.changeState(.restricteEditState)
        
        let addWallBtn = UIButton.buttonWith(title: "添加虚拟墙")
        self.view.addSubview(addWallBtn)
        addWallBtn.snp.makeConstraints { make in
            make.top.equalTo(logView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(40)
        }
        addWallBtn.addTarget(self, action: #selector(addWall), for: .touchUpInside)
        
        let addZoneBtn = UIButton.buttonWith(title: "添加禁区")
        self.view.addSubview(addZoneBtn)
        addZoneBtn.snp.makeConstraints { make in
            make.top.equalTo(logView.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-40)
        }
        addZoneBtn.addTarget(self, action: #selector(addZone), for: .touchUpInside)
        
        let resetBtn = UIButton.buttonWith(title: "恢复原始数据")
        self.view.addSubview(resetBtn)
        resetBtn.snp.makeConstraints { make in
            make.top.equalTo(addWallBtn.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(40)
        }
        resetBtn.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
        let getDataBtn = UIButton.buttonWith(title: "获取数据")
        self.view.addSubview(getDataBtn)
        getDataBtn.snp.makeConstraints { make in
            make.top.equalTo(addWallBtn.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-40)
        }
        getDataBtn.addTarget(self, action: #selector(getData), for: .touchUpInside)
    }
}

@objc extension BVForbiddenController {
    func addWall() {
        guard self.mapView.addVirtualWall() else {
            self.log("虚拟墙到达上限")
            BVHUD.showInfo("虚拟墙到达上限")
            return
        }
    }
    
    func addZone() {
        guard self.mapView.addForbiddenZone() else {
            self.log("禁区到达上限")
            BVHUD.showInfo("禁区到达上限")
            return
        }
    }
    
    func reset() {
        self.log("恢复数据")
        self.mapView.resetRestrictedToOriginal()
    }
    
    func getData() {
        guard self.mapView.canSendVirtualWallAndForbiddenZone() else {
            self.log("有虚拟墙或者禁区设置在了设备或扫地机附近")
            return
        }
        
        let wall = self.mapView.getVirtualWall()
        let zone = self.mapView.getForbiddenZone()
        
        self.log("虚拟墙： \(wall) \n禁区： \(zone)")
    }
}
