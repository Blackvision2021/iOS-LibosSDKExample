//
//  BVConfig.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/10/13.
//

import Foundation
import BVCommon

extension BVRegion {
    class var dev: BVRegion {
        return BVRegion.init(url: "https://wisdom-test.heimouyun.com", mqUrl: "mqtt-test.heimouyun.com", mqPort: 8010, mqAccount: "appuser", mqPassword: "Blackvisionuser")
    }
    
    class var test: BVRegion {
        return BVRegion.init(url: "https://wisdom-pre.heimouyun.com", mqUrl: "mqtt-pre.heimouyun.com", mqPort: 8011, mqAccount: "appuser", mqPassword: "Blackvisionuser")
    }
}
