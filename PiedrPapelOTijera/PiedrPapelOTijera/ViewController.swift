//
//  ViewController.swift
//  PiedrPapelOTijera
//
//  Created by Gigi on 10/16/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var yourSelectionLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var opponentSelectionLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        applyShadowAndCornerRadiusTo(button: rockButton)
        applyShadowAndCornerRadiusTo(button: paperButton)
        applyShadowAndCornerRadiusTo(button: scissorsButton)
        applyShadowAndCornerRadiusTo(button: playAgainButton)
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        yourSelectionLabel.text = sender.titleLabel?.text!
        
        // Show play button
        playAgainButton.isHidden = false
        
        // Hide the options
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        if let title = sender.titleLabel?.text {
            getWinnerWith(choice: title)
        }
        
     }
    
    @IBAction func tappedPlayAgain(_ sender: UIButton){
        // Hide play button
        sender.isHidden = true
        
        // Show the options
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        
        yourSelectionLabel.text = "🤩"
        winnerLabel.text = "The winner is"
    }
    
    func applyShadowAndCornerRadiusTo(button: UIButton){
        button.layer.cornerRadius = 13
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
    }
    
    func getWinnerWith(choice: String) {
        let opponentChoices: [String] = ["👊", "✋", "✌️"]
        let computerChoice = opponentChoices.randomElement()
        
        opponentSelectionLabel.text = computerChoice
        
        if let userChoice = yourSelectionLabel.text, userChoice == computerChoice {
            winnerLabel.text = "EMPATARON"
        } else if let userChoice = yourSelectionLabel.text, userChoice == "👊" && computerChoice == "✌️" {
            winnerLabel.text = "GANASTE"
        } else if let userChoice = yourSelectionLabel.text, userChoice == "👊" && computerChoice == "🖐" {
            winnerLabel.text = "PERDISTE"
        } else if let userChoice = yourSelectionLabel.text, userChoice == "✋" && computerChoice == "👊" {
            winnerLabel.text = "GANASTE"
        } else if let userChoice = yourSelectionLabel.text, userChoice == "✋" && computerChoice == "✌️" {
            winnerLabel.text = "PERDISTE"
        } else if let userChoice = yourSelectionLabel.text, userChoice == "✌️" && computerChoice == "🖐" {
            winnerLabel.text = "GANASTE"
        } else if let userChoice = yourSelectionLabel.text, userChoice == "✌️" && computerChoice == "👊"{
            winnerLabel.text = "PERDISTE"
        }
    }
}
