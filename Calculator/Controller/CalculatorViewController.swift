//
//  ViewController.swift
//  Calculator
//
//  Created by Анастасия Лагарникова on 20.02.2020.
//  Copyright © 2020 lagarnas. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    // MARK: - Private Values
    private var model = CalculatorModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        roundButtons()
    }
    
    // MARK: - IBActions
    @IBAction private func tapNumbers(_ sender: UIButton) {
        model.enter(number: sender.tag)
        updateUI()
    }
    
    @IBAction private func tapOperations(_ sender: UIButton) {
        model.enter(operationTag: sender.tag)
        updateUI()
    }
    
    @IBAction private func calc(_ sender: UIButton) {
        model.calculate()
        updateUI()
    }
    
    @IBAction private func clear(_ sender: UIButton) {
        model.clear()
        updateUI()
    }
    
    func updateUI() {
        label.text = model.result
    }
    
    private func roundButtons() {
        buttons.forEach {
            $0.layer.cornerRadius = $0.bounds.height / 2
        }
    }
}
