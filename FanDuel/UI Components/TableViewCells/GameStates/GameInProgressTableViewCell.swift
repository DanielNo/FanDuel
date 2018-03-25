//
//  GameInProgressTableViewCell.swift
//  FanDuel
//
//  Created by Daniel No on 3/23/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class GameInProgressTableViewCell: UITableViewCell {
    @IBOutlet weak var centerView: TriangleView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var homeTeamView: UIView!
    @IBOutlet weak var awayTeamView: UIView!
    let cornerRadius : CGFloat = 10.0

    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    @IBOutlet weak var quarterLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var broadcastLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundCorners()
    }
    
    func roundCorners(){
        self.containerView.layer.cornerRadius = cornerRadius
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
