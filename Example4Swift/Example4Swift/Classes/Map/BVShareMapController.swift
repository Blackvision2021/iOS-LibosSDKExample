//
//  BVShareMapController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/11/2.
//

import UIKit
import BVSweeperKit

class BVShareMapController: BVMapController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func getNavTitle() -> String {
        "分享地图模式"
    }
    
    override func getMapMode() -> BVSweeperMapViewMode {
        .shareMode
    }
}
