//
//  Game.swift
//  Apple Pie
//
//  Created by Salvador Garcia on 2/17/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
}
