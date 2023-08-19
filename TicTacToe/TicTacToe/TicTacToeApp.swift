//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Kailee Higgins Ott on 8/19/23.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    var currentPlayer = 1
    var gameBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let tag = sender.tag
        
        if gameBoard[tag] == 0 {
            gameBoard[tag] = currentPlayer
            if currentPlayer == 1 {
                sender.setTitle("X", for: .normal)
                currentPlayer = 2
            } else {
                sender.setTitle("O", for: .normal)
                currentPlayer = 1
            }
            
            checkForWin()
        }
    }
    
    func checkForWin() {
        for combination in winningCombinations {
            let a = gameBoard[combination[0]]
            let b = gameBoard[combination[1]]
            let c = gameBoard[combination[2]]
            
            if a != 0 && a == b && b == c {
                showAlert(winner: a == 1 ? "Player X" : "Player O")
                return
            }
        }
        
        if !gameBoard.contains(0) {
            showAlert(winner: "It's a draw!")
        }
    }
    
    func showAlert(winner: String) {
        let alert = UIAlertController(title: "Game Over", message: "\(winner) wins!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default) { _ in
            self.resetGame()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func resetGame() {
        for i in 0..<9 {
            gameBoard[i] = 0
            buttons[i].setTitle("", for: .normal)
        }
        currentPlayer = 1
    }
}

