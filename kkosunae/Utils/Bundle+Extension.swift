//
//  Kkosunae++Bundle.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/02.
//

import Foundation

extension Bundle {
    static func getSecurityPlistItem(key: String) -> String {
        guard let plistUrl = Bundle.main.url(forResource: "Security", withExtension: "plist") else {
            fatalError("Couldn't find file 'Security.plist'.")
        }
        
        guard let plistData = try? Data(contentsOf: plistUrl),
              let dict = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as? [String: AnyObject] else {
            fatalError("Couldn't load dictionary from data.")
        }
        
        return dict[key] as! String
    }
}
