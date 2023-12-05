//
//  ViewController.swift
//  Counter
//
//  Created by Aleksei Bondarenko on 2.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Logs {
        case increment
        case decrement
        case reset
        case decrementBelowZero
        
        var fullMessage : String {
            let date = dateFormatter.string(from: Date())
            
            switch self {
            case .increment:
                return "[\(date)]: значение изменено на +1\n"
            case .decrement:
                return "[\(date)]: значение изменено на -1\n"
            case .reset:
                return "[\(date)]: значение сброшено\n"
            case .decrementBelowZero:
                return "[\(date)]: попытка уменьшить значение счётчика ниже 0\n"
            }
        }
    }
    
    @IBOutlet private weak var titleCounterLabel: UILabel!
    
    @IBOutlet private weak var counterValueLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var clearButton: UIButton!
    
    @IBOutlet private weak var titleForHistoryTextView: UITextView!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private static let dateFormatter : DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func logAction(_ entry : Logs) {
        historyTextView.text = entry.fullMessage + historyTextView.text
    }
    
    @IBAction private func increaseCounter(_ sender: Any) {
        if let correctValue = Int(counterValueLabel.text ?? "0") {
            counterValueLabel.text = String(correctValue + 1)
            logAction(Logs.increment)
            
        }
    }
    
    @IBAction private func decreaseCounter(_ sender: Any) {
        if let correctValue = Int(counterValueLabel.text ?? "0") {
            if correctValue > 0 {
                counterValueLabel.text = String(correctValue - 1)
                logAction(Logs.decrement)
            } else {
                logAction(Logs.decrementBelowZero)
            }
        }
    }
    
    @IBAction private func clearCounterValue(_ sender: Any) {
        counterValueLabel.text = "0"
        logAction(Logs.reset)
    }
    
}

