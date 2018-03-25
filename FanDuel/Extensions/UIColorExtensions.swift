//
//  UIColorExtensions.swift
//  FanDuel
//
//  Created by Daniel No on 3/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{

    static func colorFromHex(hex : String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIColor {
    struct GamesColors {
        static var darkGrayBackground: UIColor  { return UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1) }
        static var segmentedTint: UIColor  { return UIColor(red: 65.0/255.0, green: 153.0/255.0, blue: 213.0/255.0, alpha: 1.0) }
        static var scheduledGame: UIColor  { return UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0) }
    }
}

