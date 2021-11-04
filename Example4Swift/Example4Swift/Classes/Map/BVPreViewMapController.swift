//
//  BVPreViewMapController.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/11/2.
//

import UIKit
import BVSweeperKit

class BVPreViewMapController: BVMapController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func getNavTitle() -> String {
        "预览地图模式"
    }
    
    override func getMapMode() -> BVSweeperMapViewMode {
        .mapPreviewMode
    }

}
