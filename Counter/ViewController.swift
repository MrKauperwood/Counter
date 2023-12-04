//
//  ViewController.swift
//  Counter
//
//  Created by Aleksei Bondarenko on 2.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UITextForCounter: UILabel!
    
    @IBOutlet weak var UICounterValue: UILabel!
    
    @IBOutlet weak var UIPlusButton: UIButton!
    
    @IBOutlet weak var UIMinusButton: UIButton!
    
    @IBOutlet weak var UIClearButton: UIButton!
    
    @IBOutlet weak var UIHistoryTitle: UITextView!
    
    @IBOutlet weak var UILogs: UITextView!
    
    private static let dateFormatter : DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return dateFormatter
    }()
    
    private func logAction(_ entry : Logs) {
        UILogs.text = entry.fullMessage + UILogs.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        if let currectValue = Int(UICounterValue.text ?? "0") {
            UICounterValue.text = String(currectValue + 1)
            logAction(Logs.increment)

        }
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        if let currectValue = Int(UICounterValue.text ?? "0") {
            if currectValue > 0 {
                UICounterValue.text = String(currectValue - 1)
                logAction(Logs.decrement)
            } else {
                logAction(Logs.decrementBelowZero)
            }
        }
    }
    
    @IBAction func clearCounterValue(_ sender: Any) {
        UICounterValue.text = "0"
        logAction(Logs.reset)
    }
    
    enum Logs {
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
    
}

