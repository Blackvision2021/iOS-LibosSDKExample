//
//  BVAreaController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/11/1.
//

import UIKit

class BVAreaController: BVMapController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension BVAreaController {
    override func getNavTitle() -> String {
        "划区"
    }
    
    override func initView() {
        super.initView()
        self.mapView.changeState(.planningZoneEditState)
        
        let addZoneBtn = UIButton.buttonWith(title: "添加划区")
        self.view.addSubview(addZoneBtn)
        addZoneBtn.snp.makeConstraints { make in
            make.top.equalTo(logView.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-40)
        }
        addZoneBtn.addTarget(self, action: #selector(addZone), for: .touchUpInside)
        
        let getDataBtn = UIButton.buttonWith(title: "获取数据")
        self.view.addSubview(getDataBtn)
        getDataBtn.snp.makeConstraints { make in
            make.top.equalTo(addZoneBtn.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(-40)
        }
        getDataBtn.addTarget(self, action: #selector(getData), for: .touchUpInside)
    }
}

@objc extension BVAreaController {
    func addZone() {
        guard self.mapView.addPlanningZone() else {
            self.log("划区到达上限")
            BVHUD.showInfo("划区到达上限")
            return
        }
    }
    
    func getData() {
        let zone = self.mapView.getPlanningZone()
        
        self.log("划区：\(zone)")
    }
}
