//
//  BVButton.swift
//  Libos
//
//  Created by 黑眸智能 on 2021/11/1.
//
import UIKit

extension UIButton {
    class func buttonWith(title: String) -> UIButton {
        let button = UIButton.init()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }
}
