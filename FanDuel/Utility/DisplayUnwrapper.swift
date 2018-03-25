//
//  DisplayUnwrapper.swift
//  FanDuel
//
//  Created by Daniel No on 3/25/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation

public class DisplayUnwrapper{

    public static func displayValue<T>(variable: T?) -> String {
        if let validValue = variable{
            return String(describing: validValue)
        }
        return ""
    }
    
    
    
    
    
}


