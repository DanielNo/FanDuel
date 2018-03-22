//
//  BasketballData.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation

struct BasketballData : Decodable{
    var teams : [Teams]
    var players : [Players]
    var games : [Games]
    var player_stats : [PlayerStats]
    var game_states : [GameStates]

}

struct Teams : Decodable {
    let id : Int?
    let name : String?
    let city : String?
    let record : String?
    let full_name : String?
    let abbrev : String?
    let color : String?
}

struct Players : Decodable{
    let id : Int?
    let name : String?
    let team_id : Int
}

struct Games : Decodable{
    let id : Int?
    let home_team_id : Int?
    let away_team_id : Int?
    let date : String?
    
}
struct PlayerStats : Decodable{
    let id : Int?
    let game_id : Int?
    let player_id : Int?
    let team_id : Int?
    let points : Int?
    let assists : Int?
    let rebounds : Int?
    let nerd : Float?
}
struct GameStates : Decodable{
    let id : Int?
    let game_id : Int?
    let home_team_score : Int?
    let away_team_score : Int?
    let broadcast : String?
    let quarter : Int?
    let time_left_in_quarter : String?
    let game_status : String?
    
}

