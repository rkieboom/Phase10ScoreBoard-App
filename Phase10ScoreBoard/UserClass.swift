//
//  UserClass.swift
//  Phase10ScoreBoard
//
//  Created by Rowan van den Kieboom on 07/12/2022.
//

import Foundation

class User {
    public var name: String;
    private var score: Int = 0;
    private var phase: Int = 1;
    
    init(name: String) {
        self.name = name
    }
    
    func getPhase() -> Int {
        return (phase);
    }
    
    func getScore() -> Int {
        return (score);
    }
    
    func increasePhase() {
        phase += 1;
    }
    
    func setPhase(N: Int) {
        phase = N;
    }
    
    func addScore(N: Int) {
        score += N;
    }
    
    func setScore(N: Int) {
        score = N;
    }
};
