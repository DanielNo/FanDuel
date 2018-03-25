//
//  BasketballData.swift
//  FanDuel
//
//  Created by Daniel No on 3/21/18.
//  Copyright © 2018 Daniel No. All rights reserved.
//

import Foundation

public struct BasketballData : Decodable{
    let teams : [Teams]
    let players : [Players]
    let games : [Games]
    let player_stats : [PlayerStats]
    let game_states : [GameStates]
    var teamIDDict : [Int : String]
    private enum CodingKeys: CodingKey {
        case teams
        case players
        case games
        case player_stats
        case game_states
    }

    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        teams = try values.decode([Teams].self, forKey: CodingKeys.teams)
        players = try values.decode([Players].self, forKey: CodingKeys.players)
        games = try values.decode([Games].self, forKey: CodingKeys.games)
        player_stats = try values.decode([PlayerStats].self, forKey: CodingKeys.player_stats)
        game_states = try values.decode([GameStates].self, forKey: CodingKeys.game_states)
        teamIDDict = Dictionary()
        for team in teams{
            teamIDDict[team.id!] = team.name
            print(team)
        }
    }

    
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

enum GameStatus : String, Decodable{
        case inProgress = "IN_PROGRESS"
        case scheduled = "SCHEDULED"
        case final = "FINAL"
}
struct GameStates : Decodable{
    let id : Int?
    let game_id : Int?
    let home_team_score : Int?
    let away_team_score : Int?
    let broadcast : String?
    let quarter : Int?
    let time_left_in_quarter : String?
    var game_status : GameStatus?
    
    private enum CodingKeys: CodingKey {
        case id
        case game_id
        case home_team_score
        case away_team_score
        case broadcast
        case quarter
        case time_left_in_quarter
        case game_status
    }
    
//    public init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decode(Int.self, forKey: CodingKeys.id)
//        game_id = try values.decode(Int.self, forKey: CodingKeys.game_id)
////        home_team_score = try values.decode(Int?.self, forKey: CodingKeys.home_team_score)
////        away_team_score = try values.decode(Int?.self, forKey: CodingKeys.away_team_score)
//        broadcast = try values.decode(String.self, forKey: CodingKeys.broadcast)
//        quarter = try values.decode(Int.self, forKey: CodingKeys.quarter)
//        time_left_in_quarter = try values.decode(String.self, forKey: CodingKeys.time_left_in_quarter)
//        
//        do {
////            let val = try values.decode(String.self, forKey: CodingKeys.game_status)
////            if(val != GameStatus.final && val != GameStatus.inProgress && GameStatus.scheduled){
////                game_status = GameStatus.invalid
////            }
//            game_status = try values.decode(GameStatus.self, forKey: CodingKeys.game_status)
//        } catch let error {
//            game_status = GameStatus.invalid
//            print(error)
//        }
//        game_status = try values.decode(GameStatus.self, forKey: CodingKeys.game_status)
//    }

    
    
}




