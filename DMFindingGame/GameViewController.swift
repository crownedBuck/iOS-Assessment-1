//
//  GameViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 2/19/23.
//

import UIKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet var buttonsLabelArray: Array<UIButton>?
    
    var targetLetter = ""
    var randomLetters = [String]()
    var score = 0
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        
        targetLetter = letters.randomElement()!
        print("targetLetter: \(targetLetter)")
        randomLetters = generateRandomLetters(numLetters: 12)
        print("newRound: \(randomLetters)")
        print("")
        updateTargetLetterLabel()
        updateLetterButtons()
    }
    
    func generateRandomLetters(numLetters: Int) -> [String] {
        var currentRandomLetters = [String]()
        var number: Int
        
        currentRandomLetters = Array(letters.shuffled().prefix(numLetters))
        print("generateRandomLetters just before inserting targetLetter: \(currentRandomLetters)")
        print("Number in currentRandomLetters: \(currentRandomLetters.count)")
        number = Int.random(in: 0..<currentRandomLetters.count)
        
        if (!(currentRandomLetters.contains(targetLetter))) {
            currentRandomLetters[number] = targetLetter
        }
//        targetLetter = currentRandomLetters.randomElement()!
//        print(targetLetter)
        print("generateRandomLetters: \(currentRandomLetters)")
        return currentRandomLetters
    }
    
    func calculateNewScore(selectedLetter: String) {
        if selectedLetter == targetLetter {
            score += 1
        }
    }

    
    func updateTargetLetterLabel() {
        letterLabel.text = "\(targetLetter)"
        
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
        print(score)
        
    }
    
    func updateLetterButtons() {
        
        var loopingNumber = 0
        
        while loopingNumber < buttonsLabelArray!.count {
            
            buttonsLabelArray![loopingNumber].setTitle(randomLetters[loopingNumber], for: .normal)
            
            loopingNumber += 1
        }
    }
    
    @IBAction func letterButtonTouched(_ sender: UIButton) {
        print(sender.currentTitle!)
        print("The letter was pressed!")
        
        calculateNewScore(selectedLetter: "\(sender.currentTitle!)")
        updateScoreLabel()
        newRound()
        
    }
    
}
