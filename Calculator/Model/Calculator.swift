//
//  Calculator.swift
//  Calculator
//
//  Created by Micaella Morales on 1/2/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    private var number: Double?

    private var operands = [Double]()
    private var operations = [String]()

    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    static func isInt(_ displayValue: Double) -> Bool {
        return floor(displayValue) == displayValue
    }
    
    private mutating func intermediateCalculation() -> Double? {
        if operands.count >= 2 {
            if let result = performTwoNumberCalculation() {
                operands.append(result)
                return result
            }
        }
        return number
    }
    
    private mutating func performTwoNumberCalculation() -> Double? {
        if let n2 = operands.popLast(), let n1 = operands.popLast() {
            let operation = operations[0]
            operations.remove(at: 0)
            print("\(n1) \(operation) \(n2)")
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let number = number {
            switch symbol {
            case "AC":
                operands.removeAll()
                operations.removeAll()
                return 0
            case "+/-":
                return number * -1
            case "%":
                return number / 100
            case "=":
                operands.append(number)
                return performTwoNumberCalculation()
            default:
                operations.append(symbol)
                operands.append(number)
                return intermediateCalculation()
            }
        }
        return nil
    }
    
}
