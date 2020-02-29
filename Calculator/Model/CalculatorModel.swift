//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Анастасия Лагарникова on 27.02.2020.
//  Copyright © 2020 lagarnas. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    // MARK: - Values
    private var numberOnScreen: Double = 0
    private var previousNumber: Double = 0
    private var needClear = true
    private var operation: MathOperation?
    private var valueOnScreen: String = "0"
    
    var result: String {
        valueOnScreen
    }
    
    func enter(number: Int) {
        if needClear {
            numberOnScreen = Double(number)
            needClear = false
        } else {
            numberOnScreen = numberOnScreen * 10 + Double(number)
        }
        valueOnScreen = String(numberOnScreen)
    }
    
    func enter(operationTag: Int) {
        guard let operation = MathOperation(rawValue: operationTag) else {
            return
        }
        
        enter(operation: operation)
    }
    
    func enter(operation: MathOperation) {
        if let operation = self.operation {
            previousNumber = operation.result(previousNumber, numberOnScreen)
        } else {
            previousNumber = numberOnScreen
        }
        
        self.operation = operation
        needClear = true
        valueOnScreen = operation.description
    }
    
    func calculate() {
        guard let operation = operation else {
            return
        }
        
        numberOnScreen = operation.result(previousNumber, numberOnScreen)
        valueOnScreen = String(numberOnScreen)
        self.operation = nil
    }
    
    func clear() {
        previousNumber = 0
        numberOnScreen = 0
        operation = MathOperation(rawValue: 0)
        needClear = true
        valueOnScreen = "0"
    }
    
}
