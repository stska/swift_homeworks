//
//  main.swift
//  homework_7
//
//  Created by user155176 on 13/07/2019.
//  Copyright © 2019 user155176. All rights reserved.
//
//-----------------------------------------------------------------------------------------------------------
//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

import Foundation

enum PredictionsError:Error{
    case noLifepoints(healthPoints: Int)
    case noFreesteps(steps: Int)
    case wrongButton
    case noSuchName
    case emptyNick
}

struct Player {
    var nickName: String
    var healthpoints:Int
    var action: String
    var steps: Int
}

class Game {
    
    let gameParameters:[String: Int] = ["steps": 6, "healthPoints": 100]                                //max stepts one playes can use and the max health
    let actions = ["A","W","S","D"]                                                                    //allowed buttons
    
    var playersCurrentStatus = [                                                                      //a variable with players in the game with whome we will check our instance
        "Moris": Player(nickName: "sweetKiller", healthpoints: 100, action: "W", steps: 1),
        "Sveta": Player(nickName: "hardStone", healthpoints: 50, action: "J",steps: 6),
        "Boris": Player(nickName: "Boris Britva", healthpoints: -20, action: "S",steps: 0)
    ]
    
    var name: String
    var nick:String
    var step:Int
    var healthpoints:Int
    var action:String
    
    
    
    init(name:String, step: Int, healthpoints: Int, action: String, nick:String) {
        self.step = step
        self.name = name
        self.healthpoints = healthpoints
        self.action = action
        self.nick = nick
    }
    
    func checkStatusOfPlayers (name: String,/*step: Int,healthpoints: Int, action: String,*/nick: String) throws {       // check if we have such a player in our dataBase
        
        guard let player = playersCurrentStatus[name] else {
            throw PredictionsError.noSuchName
        }
        
        guard !player.nickName.isEmpty else {
            throw PredictionsError.emptyNick
        }
        print("There is a player like this")
    }
    
    func checkPlayersStats (name:String, nick:String,step: Int,healthpoints: Int, action: String) throws{             //  check players conditions
        guard let player = playersCurrentStatus[name], nick == playersCurrentStatus[name]?.nickName else {
            throw PredictionsError.noSuchName
        }
        
        guard player.healthpoints <= gameParameters["healthPoints"]! && player.healthpoints > 0 else {
            throw PredictionsError.noLifepoints(healthPoints: player.healthpoints)
            //gameParameters["healthPoints"]!
            
        }
        guard actions.contains(player.action) else {
            throw PredictionsError.wrongButton
        }
        guard player.steps <= gameParameters["steps"]! else {
            throw PredictionsError.noFreesteps(steps: gameParameters["steps"]! - player.steps)
        }
        
        print("stats of this player is realiable")
    }
}

var test = Game(name: "Moris", step: 5, healthpoints: 100, action: "W", nick: "Buu")              //new instance to check


do {
    try test.checkStatusOfPlayers(name: test.name, nick: test.nick)
    print("Well, done mate")
} catch PredictionsError.emptyNick {
    print("Wrong nickname or there is no such players, please try again")
}

do {
    try test.checkPlayersStats(name: test.name, nick: test.nick , step: test.step, healthpoints: test.healthpoints, action: test.action)
}  catch PredictionsError.noFreesteps(steps: 5) {
    print("you have zero steps")
} catch PredictionsError.wrongButton {
    print("You tapped the wrong button, please use pre-installed button")
} catch PredictionsError.noLifepoints(healthPoints: test.healthpoints){
    print("Opps, you are dead")
}

/*
 check what we have without do -> try -> catch
 print(try test.checkStatusOfPlayers(named: "Sveta"))        //wrong button
print(try test.checkStatusOfPlayers(named: "Boris"))      //wrong healthpoints
print(try test.checkStatusOfPlayers(named: "Moris"))         //eveything is OKey
*/
