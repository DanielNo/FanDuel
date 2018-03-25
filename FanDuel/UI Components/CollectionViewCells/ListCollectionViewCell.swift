//
//  ListCollectionViewCell.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setDataSource(dataSource : UITableViewDataSource){
        
//        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        self.tableView.register(UINib(nibName: "GamesTableViewCell", bundle: nil), forCellReuseIdentifier: "gamesCell")

    }
    
//    public func configureForList(listType : Int){
//        switch listType {
//        case 0:
//            let datasource = GamesTableViewDataSource()
//            self.tableView.dataSource = datasource
//            self.tableView.delegate = datasource
//            self.tableView.register(UINib(nibName: "GamesTableViewCell", bundle: nil), forCellReuseIdentifier: "gamesCell")
//        case 1:
//            self.tableView.dataSource = GamesTableViewDataSource()
//        default:
//            print("")
//        }
//        
//    }

}
