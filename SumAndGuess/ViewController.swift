//
//  ViewController.swift
//  SumAndGuess
//
//  Created by Кирилл  Геллерт on 22.11.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var sumButton: UIButton!
    @IBOutlet weak var guessTheNumber: UIButton!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showNameAlert()
    }
    
    @IBAction func showSumAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Sum count", message: "Print 2 numbers", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "=", style: .default, handler: { [unowned self] (_)  in
            let result = numberFromTextField(alert: alert, fieldIndex: 0) +  numberFromTextField(alert: alert, fieldIndex: 1)
            self.sumLabel.text = ("Sum is: \(result)")
            sumLabel.isHidden = false
        }))
        
        alert.addTextField(configurationHandler: nil)
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showGuesAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Lucky", message: "Guess a number from 1 to 10", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Take a guess", style: .default, handler: {[unowned self] (_)  in
            let result = numberFromTextField(alert: alert, fieldIndex: 0)
            let randomNumber = Int.random(in: 1...10)
            if result == randomNumber {
                self.sumLabel.text = ("YOU RIGHT IS: \(randomNumber)")
                self.sumLabel.isHidden = false
            } else {
                self.sumLabel.text = ("Sorry is: \(randomNumber)")
                self.sumLabel.isHidden = false
            }
        }))
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberFromTextField(alert: UIAlertController, fieldIndex: Int) -> Int {
        if let text = alert.textFields?[fieldIndex].text {
            return Int(text) ?? 0
        }
        
        return 0
    }
    
    func showNameAlert() {
        let alert = UIAlertController(title: "Hello!", message: "Print your name", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { [unowned self] (_) in
            if let text = alert.textFields?.first?.text {
                self.hiLabel.text = ("Hi, \(text)")
                self.hiLabel.isHidden = false
            }
        }

        alert.addTextField(configurationHandler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

