//
//  BVHUD.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/10/13.
//

import UIKit
import SVProgressHUD

class BVHUD: NSObject {
    class func showInfo(_ info: String) {
        SVProgressHUD.showInfo(withStatus: info)
    }
    
    class func showLoading(_ loading: String) {
        SVProgressHUD.show(withStatus: loading)
    }
    
    class func dismiss() {
        SVProgressHUD.dismiss()
    }
}
