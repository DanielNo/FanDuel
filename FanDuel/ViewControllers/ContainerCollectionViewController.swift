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
    @IBOutlet weak var segmentedControl: UISegmentedControl!{
        didSet{
            segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(segControl:)), for: UIControlEvents.valueChanged)
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
            collectionView.register(nib, forCellWithReuseIdentifier: listCellReuseID)
            
        }
    }
    
    let listCellReuseID = "listCell"
    lazy var gamesDataSource = GamesTableViewDataSource()
    lazy var statsDataSource = StatsTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parser = FileParser()
        let basketballData = parser.readFile(fileName: "basketballData", extension: "json") { (data) in
            print(data?.teams)
        }
    }
    
    @objc func segmentedControlChanged(segControl : UISegmentedControl){
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
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: listCellReuseID, for: indexPath as IndexPath) as! ListCollectionViewCell
        let section = ContainerSection(rawValue: indexPath.section)!
        switch section {
        case ContainerSection.gamesSection:
            cell.tableView.backgroundColor = UIColor.blue
            cell.tableView.delegate = gamesDataSource
            cell.tableView.dataSource = gamesDataSource
            cell.tableView.register(UINib(nibName: "GamesTableViewCell", bundle: nil), forCellReuseIdentifier: gamesDataSource.gamesCellReuseID)
        case ContainerSection.statsSection:
            
            cell.tableView.backgroundColor = UIColor.red
            cell.tableView.delegate = statsDataSource
            cell.tableView.dataSource = statsDataSource
            cell.tableView.register(UINib(nibName: "StatsTableViewCell", bundle: nil), forCellReuseIdentifier: statsDataSource.statsCellReuseID)
        default:
            assert(false, "invalid collectionview section")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.size.width, height: self.collectionView.frame.size.height)
        print(size)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

}

