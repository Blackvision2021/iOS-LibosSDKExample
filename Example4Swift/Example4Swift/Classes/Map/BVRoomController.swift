//
//  BVRoomController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/11/1.
//

import UIKit
import BVSweeperKit

class BVRoomController: BVMapController {
    
    var nameBtn: UIButton!
    var fenggeBtn: UIButton!
    var hebingBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BVRoomController {
    override func getNavTitle() -> String {
        "房间编辑"
    }
    
    override func getMapMode() -> BVSweeperMapViewMode {
        .roomEditMode
    }
    
    override func initView() {
        super.initView()
        
        self.mapView.editRoomDelegate = self
        
        
        let recoverBtn = UIButton.buttonWith(title: "恢复选择")
        self.view.addSubview(recoverBtn)
        recoverBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logView.snp.bottom).offset(10)
        }
        recoverBtn.addTarget(self, action: #selector(recover), for: .touchUpInside)
        
        nameBtn = self.createButton(title: "重命名")
        self.view.addSubview(nameBtn)
        nameBtn.snp.makeConstraints { make in
            make.top.equalTo(recoverBtn.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        nameBtn.addTarget(self, action: #selector(name), for: .touchUpInside)
        
        fenggeBtn = self.createButton(title: "分割")
        self.view.addSubview(fenggeBtn)
        fenggeBtn.snp.makeConstraints { make in
            make.top.equalTo(recoverBtn.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        fenggeBtn.addTarget(self, action: #selector(fenge), for: .touchUpInside)
        
        hebingBtn = self.createButton(title: "合并")
        self.view.addSubview(hebingBtn)
        hebingBtn.snp.makeConstraints { make in
            make.top.equalTo(recoverBtn.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        hebingBtn.addTarget(self, action: #selector(hebing), for: .touchUpInside)
        
        
        let fengeOKBtn = self.createButton(title: "获取分割点")
        self.view.addSubview(fengeOKBtn)
        fengeOKBtn.snp.makeConstraints { make in
            make.top.equalTo(hebingBtn.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        fengeOKBtn.addTarget(self, action: #selector(fengeOk), for: .touchUpInside)
        
        log("选择房间，再选择操作")
        log("分割房间之后再点击<获取分割点>按钮")
        
        recover()
    }
    
    func createButton(title: String) -> UIButton {
        let button = UIButton.buttonWith(title: title)
        button.setTitleColor(.systemGray, for: .disabled)
        return button
    }
}

@objc extension BVRoomController {
    func recover() {
        self.mapView.resetRoomCheck()
        self.nameBtn.isEnabled = false
        self.fenggeBtn.isEnabled = false
        self.hebingBtn.isEnabled = false
    }
    
    func name() {
        guard let model = self.mapView.getCheckRooms().first else {
            return
        }
        let oldName = model.roomName ?? "null"
        let no = model.no
        
        self.log("将房间号： \(no) 原名称：\(oldName) 改名")
        
        recover()
    }
    
    func fenge() {
        guard self.mapView.canSliptRoom() else {
            log("房间数量到达上限")
            BVHUD.showInfo("房间数量到达上限")
            recover()
            return
        }
        self.mapView.changeState(.roomSplitState)
        log("分割房间  可以在屏幕上分割)")
    }
    
    func fengeOk() {
        guard let roomId = self.mapView.getCheckRoomIds().first else {
            return
        }
        
        let p1 = self.mapView.getRoomSplitStartPoint()
        let p2 = self.mapView.getRoomSplitEndPoint()
        
        log("分割房间  房间号：\(roomId)  分割点 起点：\(p1)  重点：\(p2)")
        
        recover()
    }
    
    func hebing() {
        let roomIds = self.mapView.getCheckRoomIds()
        log("合并房间  房间号：\(roomIds)")
        recover()
    }
}

extension BVRoomController: BVSweeperMapViewRoomEditDelegate {
    func mapView(_ view: BVSweeperMapView, didCheckRoomCount count: Int) {
        if count == 0 {
            self.nameBtn.isEnabled = false
            self.fenggeBtn.isEnabled = false
            self.hebingBtn.isEnabled = false
        } else if count == 1 {
            self.nameBtn.isEnabled = true
            self.fenggeBtn.isEnabled = true
            self.hebingBtn.isEnabled = false
        } else if count == 2 {
            self.nameBtn.isEnabled = false
            self.fenggeBtn.isEnabled = false
            self.hebingBtn.isEnabled = true
        }
    }
}
