//
//  ViewController.swift
//  CounterApp
//
//  Created by Ilia Liasin on 18/07/2024.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var increaseeButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var count: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var counter = 0
    private var historyContent = ""
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    //MARK: - Private
    private func setupAppearance() {
        count.text = String(counter)
        count.textAlignment = .center
        
        decreaseButton.setTitle("+", for: .normal)
        decreaseButton.tintColor = .red
        decreaseButton.layer.borderWidth = 1
        decreaseButton.layer.cornerRadius = 10
        
        increaseeButton.setTitle("-", for: .normal)
        increaseeButton.tintColor = .blue
        increaseeButton.layer.borderWidth = 1
        increaseeButton.layer.cornerRadius = 10
        
        resetButton.setTitle("reset", for: .normal)
        resetButton.tintColor = .gray
        resetButton.layer.borderWidth = 1
        resetButton.layer.cornerRadius = 10
        
        historyTextView.text = "История изменений:\n"
        historyTextView.isEditable = false
        historyTextView.isScrollEnabled = true
    }
    
    @IBAction private func decreaseButtonTapped(_ sender: UIButton) {
        var str = ""
        if counter == 0 {
            counter = 0
            str = "[\(Date.now.formatted(.dateTime)))]: попытка уменьшить значение счётчика ниже 0\n"
        } else {
            counter -= 1
            str = "[\(Date.now.formatted(.dateTime))]: значение изменено на -1\n"
        }
        updateCounter(for: sender)
        updateHistoryTextView(with: str)
    }
    
    @IBAction private func increaseButtonTapped(_ sender: UIButton) {
        counter += 1
        updateCounter(for: sender)
        updateHistoryTextView(with: "[\(Date.now.formatted(.dateTime)))]: значение изменено на +1\n")
    }
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        counter = 0
        updateCounter(for: sender)
        updateHistoryTextView(with: "[\(Date.now.formatted(.dateTime)))]: значение сброшено\n")
    }
    
    private func updateCounter(for button: UIButton) {
        count.text! = String(counter)
    }
    
    private func updateHistoryTextView(with text: String) {
        historyTextView.text += text
    }
}


