//
//  ViewController.swift
//  Calculator
//
//  Created by Анастасия Лагарникова on 20.02.2020.
//  Copyright © 2020 lagarnas. All rights reserved.
//

import UIKit


enum MathOperation: Int {
    case divide = 11, multy, minus, plus
}

class ViewController: UIViewController {

    //число на экране
    var numberOnScreen: Double = 0
    //предыдущие числа
    var previousNumber: Double = 0
    //
    var performingMath = true
    //операция
    var operation: MathOperation? = nil
    
    @IBOutlet weak var label: UILabel!
    
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
        operation = MathOperation.init(rawValue: sender.tag)
        performingMath = true
        switch operation {
            case .divide: //divide
                label.text = "/"
            case .multy: //multiply
                label.text = "x"
            case .minus: //minus
                label.text = "-"
            case .plus: //plus
                label.text = "+"
            default:
                break
        }
    }
    
    
    
    @IBAction func calc(_ sender: UIButton) {
        switch operation {
        case .divide: //divide
                label.text = String(previousNumber / numberOnScreen)
        case .multy: //multiply
                label.text = String(previousNumber * numberOnScreen)
        case .minus: //minus
                label.text = String(previousNumber - numberOnScreen)
        case .plus: //plus
                label.text = String(previousNumber + numberOnScreen)
            default:
                break
        }
    }
    
    //очищение
    @IBAction func clear(_ sender: UIButton) {
        label.text = ""
        previousNumber = 0
        numberOnScreen = 0
        operation = nil
        performingMath = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


