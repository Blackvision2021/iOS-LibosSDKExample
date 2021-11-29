//
//  BVBaseController.swift
//  Example4Swift
//
//  Created by 黑眸智能 on 2021/11/16.
//

import UIKit

class BVBaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("\(self.classForCoder) 实例已销毁")
    }
}
