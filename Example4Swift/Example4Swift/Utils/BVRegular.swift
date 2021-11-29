//
//  BVRegular.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/10/13.
//

import UIKit
import GZIP

class BVRegular: NSObject {
    class func loadData() -> Data?{
        if let bundle = Bundle.main.url(forResource: "compr_map", withExtension: "txt") {
            do {
                let data = try Data.init(contentsOf: bundle)
                if let gData = (data as NSData).gzipped() {
                    return gData
                }
            } catch let error {
                print("出错:\(error)")
            }
        }
        
        return nil
    }
}
