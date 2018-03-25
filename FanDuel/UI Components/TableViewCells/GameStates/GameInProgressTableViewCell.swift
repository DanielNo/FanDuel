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
    
    public func configureCellForGame(data : BasketballData?, indexPath : IndexPath){
        let gameStates = data?.game_states
        let game = gameStates?[indexPath.row]

        guard let gameID = game?.game_id else{
            return
        }
        if let homeID = data?.gameIDDict[gameID]?.home_team_id, let awayID = data?.gameIDDict[gameID]?.away_team_id{
            self.homeTeamName.text = data?.teamNameForID(homeID)
            self.awayTeamName.text = data?.teamNameForID(awayID)
            if let awayScore = game?.away_team_score, let homeScore = game?.home_team_score{
                self.centerView.shape = awayScore > homeScore ? ViewShape.leftTriangle : ViewShape.rightTriangle
                let winningTeamID = awayScore > homeScore ? awayID : homeID
                if let colorString = data?.teamIDDict[winningTeamID]?.color{
                    let winningColor = UIColor.colorFromHex(hex: colorString)
                    self.centerView.fillColor = winningColor
                }
            }

        }

        self.awayTeamScore.text = DisplayUnwrapper.displayValue(variable: game?.away_team_score)
        self.homeTeamScore.text = DisplayUnwrapper.displayValue(variable: game?.home_team_score)
        if let quarter = game?.quarter{
            self.quarterLabel.text = QuarterString(rawValue:quarter)?.description
        }
        self.broadcastLabel.text = game?.broadcast
        self.timeLabel.text = game?.time_left_in_quarter
    }
    
}

enum QuarterString : Int, CustomStringConvertible  {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
    
    var description: String {
        switch self {
        case .first:
            return "1st"
        case .second:
            return "2nd"
        case .third:
            return "3rd"
        case .fourth:
            return "4th"
        default:
            return ""
        }
    }
}


