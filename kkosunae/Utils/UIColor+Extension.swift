//
//  UIColor+Extension.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/03.
//

import UIKit

extension UIColor {
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    static var visvisColor: UIColor {
        return UIColor(hexCode: "FFE888")
    }
    
    static var goldenYellowColor: UIColor {
        return UIColor(hexCode: "F7C451")
    }
    
    static var shakespeareColor: UIColor {
        return UIColor(hexCode: "739ABB")
    }
    
    static var creamColor: UIColor {
        return UIColor(hexCode: "FFF7E1")
    }
    
    static var greenLeafColor: UIColor {
        return UIColor(hexCode: "467505")
    }
    
    static var orangeRedColor: UIColor {
        return UIColor(hexCode: "FF4200")
    }
    
    static var nightBlackColor: UIColor {
        return UIColor(hexCode: "353535")
    }
    
    static var kkoWhiteColor: UIColor {
        return UIColor(hexCode: "FFFFFF")
    }
}
