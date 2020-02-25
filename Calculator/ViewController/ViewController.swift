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
    //число на экране
    var numberOnScreen: Double = 0
    //предыдущее число
    var previousNumber: Double = 0
    //проверка что на экране символ операции
    var performingMath = true
    //операция
    var operation: MathOperation?
    
    //var model: MathOperationModel = MathOperationModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    
    // MARK: - IBActions
    //функция для чисел
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }else {
            label.text = label.text! + String(sender.tag)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    //функция для операций с числами
    @IBAction func buttons(_ sender: UIButton) {
        previousNumber = Double(label.text!)!
        operation = MathOperation(rawValue: sender.tag)
        performingMath = true
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
        performingMath = true
    }
    
    
}


