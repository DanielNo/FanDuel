//
//  ContainerCollectionViewController.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit
enum ContainerSection : Int{
    case gamesSection = 0
    case statsSection = 1
}

class ContainerCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    let listCellReuseID = "listCell"
    @IBOutlet weak var segmentedControl: UISegmentedControl!{
        didSet{
            segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(segControl:)), for: UIControlEvents.valueChanged)
            segmentedControl.tintColor = UIColor.GamesColors.segmentedTint
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: listCellReuseID)
            
        }
    }
    
    var data : BasketballData? {
        willSet{
            if let basketballData = newValue{
                self.gamesDataSource = GamesTableViewDataSource(basketballData)
                self.statsDataSource = StatsTableViewDataSource(basketballData)
            }
        }
    }
    var gamesDataSource : GamesTableViewDataSource?
    var statsDataSource : StatsTableViewDataSource?
    let fileParser = FileParser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.setupUI()
    }
    
    func loadData(){
        fileParser.readFile(fileName: "basketballData", extension: "json") { [weak self](data) in
            guard let jsonData = data else{
                return
            }
            self?.data = jsonData
        }
    }
    
    func setupUI(){
        self.view.backgroundColor = UIColor.GamesColors.darkGrayBackground
    }
    
    @objc func segmentedControlChanged(segControl : UISegmentedControl){
        guard self.data != nil else{
            return
        }
        let index = segControl.selectedSegmentIndex
        switch index {
        case 0:
            collectionView.scrollToItem(at: IndexPath.init(item: 0, section: 0), at: UICollectionViewScrollPosition.left, animated: true)
        case 1:
            collectionView.scrollToItem(at: IndexPath.init(item: 0, section: 1), at: UICollectionViewScrollPosition.right, animated: true)
        default:
            collectionView.scrollToItem(at: IndexPath.init(item: 0, section: 0), at: UICollectionViewScrollPosition.top, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int((collectionView.contentOffset.x / collectionView.frame.size.width).rounded())
        segmentedControl.selectedSegmentIndex = page
    }
    
}

extension ContainerCollectionViewController{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let sections = (self.data == nil) ? 0 : 2
        return sections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellReuseID, for: indexPath as IndexPath) as! ListCollectionViewCell
        let section = ContainerSection(rawValue: indexPath.section)!
        switch section {
        case ContainerSection.gamesSection:
            if let gamesDelegate = gamesDataSource{
                cell.tableView.delegate = gamesDelegate
                cell.tableView.dataSource = gamesDelegate
                cell.tableView.register(UINib(nibName: "GameInProgressTableViewCell", bundle: nil), forCellReuseIdentifier: gamesDelegate.gameInProgressCellID)
                cell.tableView.register(UINib(nibName: "GameCompletedTableViewCell", bundle: nil), forCellReuseIdentifier: gamesDelegate.gameCompletedCellID)
                cell.tableView.register(UINib(nibName: "GameScheduledTableViewCell", bundle: nil), forCellReuseIdentifier: gamesDelegate.gameScheduledCellID)
                cell.backgroundColor = UIColor.clear
                cell.tableView.backgroundColor = UIColor.clear

            }
        case ContainerSection.statsSection:
            if let statsDelegate = statsDataSource{
                cell.tableView.delegate = statsDelegate
                cell.tableView.dataSource = statsDelegate
                cell.tableView.register(UINib(nibName: "StatsTableViewCell", bundle: nil), forCellReuseIdentifier: statsDelegate.statsCellReuseID)
            }
        default:
            assert(false, "invalid collectionview section")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size : CGSize
        switch indexPath.section {
        case 0:
            size = CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
        case 1:
            size = CGSize(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)

        default:
            size = CGSize(width: self.view.frame.size.width, height: self.collectionView.frame.size.height)
        }
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

}

