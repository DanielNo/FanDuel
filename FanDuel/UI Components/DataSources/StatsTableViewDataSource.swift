//
//  StatsTableViewDataSource.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation
import UIKit

class StatsTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate
{
    let data = [1,2,3,4,5]
    let statsCellReuseID = "statsCell"

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: statsCellReuseID) as! StatsTableViewCell
        return cell
    }
    
}

