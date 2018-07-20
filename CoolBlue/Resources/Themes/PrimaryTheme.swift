//
//  PrimaryTheme.swift
//  CoolBlue
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import UIKit
import SwifterSwift

struct PrimaryTheme {
    
    enum fontStyle {
        case title
        case description
        case price
        case reviews
        case nextDayDelivery
    }
    
}

extension UIColor {
    struct appTheme {
        struct colors {
            static let Blue = UIColor.init(hexString: "2A5EA8")
            static let BlueLight = UIColor.init(hexString: "1893E1")
            static let Orange = UIColor.init(hexString: "FF6600")
            static let Green = UIColor.init(hexString: "00b900")
            static let LightGray = UIColor.init(hexString: "f3f3f3")
            static let DarkGray = UIColor.init(hexString: "E4E3E3")
        }
    }
}

extension UIView {
    func setBottomBorder() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.appTheme.colors.DarkGray?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
}
