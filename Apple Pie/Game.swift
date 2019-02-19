//
//  Game.swift
//  Apple Pie
//
//  Created by Salvador Garcia on 2/17/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import Foundation

//Created a struct called Game the has word, incorrectMoveRemaining,and guessedLetters. Contains a mutating function that checks if the letter is contained within the word. If not, then decrease incorrectMovesRemaining by 1
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var formattedWord: String{
        var guessedword = ""
        for letter in word.characters{
            if guessedLetters.contains(letter){
                guessedword += "\(letter)"
            } else {
                guessedword += "_"
            }
        }
        return guessedword
    }
    
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
}
