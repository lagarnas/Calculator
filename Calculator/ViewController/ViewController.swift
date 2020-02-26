//
//  ViewController.swift
//  Calculator
//
//  Created by Анастасия Лагарникова on 20.02.2020.
//  Copyright © 2020 lagarnas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Values
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var needClear = true
    var operation: MathOperation?

    
    //var model: MathOperationModel = MathOperationModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: - IBActions
    @IBAction func numbers(_ sender: UIButton) {
        if needClear {
            label.text = String(sender.tag)
            //мат выполнение
            needClear = false
        }else {
            label.text = label.text! + String(sender.tag)
        }
        numberOnScreen = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if operation != nil {
            previousNumber = operation!.result(previousNumber, numberOnScreen)
        } else {
            previousNumber = numberOnScreen
        }
        operation = MathOperation(rawValue: sender.tag)
        needClear = true
        label.text = operation!.description
    }
    //result
    @IBAction func calc(_ sender: UIButton) {
        label.text = String(operation!.result(previousNumber, numberOnScreen))
    }
    
    //clear
    @IBAction func clear(_ sender: UIButton) {
        label.text = "0"
        previousNumber = 0
        numberOnScreen = 0
        operation = MathOperation(rawValue: 0)
        needClear = true
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //roundButtons()
    }
    
    private func roundButtons() {

    }
}


