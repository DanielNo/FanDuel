//
//  StringExtensions.swift
//  FanDuel
//
//  Created by Daniel No on 3/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String, size : CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: size)]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
}
