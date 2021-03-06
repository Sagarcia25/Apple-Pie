//
//  ViewController.swift
//  Apple Pie
//
//  Created by Salvador Garcia on 2/14/19.
//  Copyright © 2019 Salvador Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["charizard", "venusaur", "blastoise", "typhlosion", "meganium", "feraligatr"]
    
    let incorrectMovesAllowed = 7
    
    var totalwins = 0
    var totalLosses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //created an instance currentGame of the struct Game
    var currentGame: Game!
    
    //Function newRound removes the first string in the array. currentGame is given a new word, incorrect moves remaining, and holds letters guessed
    func newRound(){
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        updateUI()
    }

    //function updateUI updates the label with the amount of wins and losses. Also updates the tree image depending the amount of incorect moves left
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord.characters{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
//        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalwins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
//        updateUI()
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord{
            totalwins += 1
        } else {
            updateUI()
        }
    }
    
}

