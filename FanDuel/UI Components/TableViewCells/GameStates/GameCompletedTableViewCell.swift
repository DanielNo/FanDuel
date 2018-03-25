//
//  GameCompletedTableViewCell.swift
//  FanDuel
//
//  Created by Daniel No on 3/23/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import UIKit

class GameCompletedTableViewCell: UITableViewCell {
    @IBOutlet weak var centerView: TriangleView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var awayTeamView: UIView!
    @IBOutlet weak var homeTeamView: UIView!
    let cornerRadius : CGFloat = 10.0

    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    
    
    
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
