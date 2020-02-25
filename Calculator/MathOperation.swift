//
//  MathOperation.swift
//  Calculator
//
//  Created by Анастасия Лагарникова on 24.02.2020.
//  Copyright © 2020 lagarnas. All rights reserved.
//

import Foundation

enum MathOperation: Int {
    case divide = 11, multy, minus, plus
    
    var description: String {
        switch self {
        case .divide: //divide
            return "/"
        case .multy: //multiply
            return "x"
        case .minus: //minus
            return "-"
        case .plus: //plus
            return "+"
        }
    }
    
    func result(_ a: Double, _ b: Double) -> Double {
        switch self {
        case .divide: //divide
            return a / b
        case .multy: //multiply
            return a * b
        case .minus: //minus
            return a - b
        case .plus: //plus
            return a + b
        }
    }
}
