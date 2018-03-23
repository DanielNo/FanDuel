//
//  FileParser.swift
//  FanDuel
//
//  Created by Daniel No on 3/22/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation

public class FileParser{
    
    lazy var jsonDecoder : JSONDecoder = {
        return JSONDecoder()
    }()
    
    func readFile(fileName: String, extension: String, completion: @escaping (BasketballData?) -> Void) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try jsonDecoder.decode(BasketballData.self, from: data)
                completion(jsonData)
            } catch {
                print("error reading file:\(error)")
            }
        }
    }
    
    
    
}


