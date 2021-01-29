//
//  Game.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 14.01.2021.
//

import Foundation

struct LeaderboardEntry{
    let score : Int
    let date : Date
}

struct Game{
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    //struct initializer
    init(loadTestData: Bool = false){
        if loadTestData{
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))

        }
    }
    
    func points(sliderValue: Int) -> Int{
        let difference : Int = abs(target - sliderValue)
        let bonus : Int
        switch difference {
        case 0:
            bonus = 100
            break
        case 1,2:
            bonus = 50
            break
        default:
            bonus = 0
            break
        }
        return 100 - difference + bonus
        //there is no need to type "return" in this case also!
        // 100 - abs(target - sliderValue)
    }
    
    //mutating means that function changes the struct values itself
    mutating func startNewRound(points: Int){
        addToLeaderBoard(score: points)
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart(){
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating private func addToLeaderBoard(score: Int){
        leaderboardEntries.append(LeaderboardEntry(score: score,date: Date()))
        leaderboardEntries.sort {$0.score > $1.score}
    }
}
