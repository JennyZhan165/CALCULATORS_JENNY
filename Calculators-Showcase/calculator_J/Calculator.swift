//
//  Calculator.swift
//  calculator_J
//
//  Created by Yunhan Zhan on 9/4/20.
//  Copyright © 2020 Yunhan Zhan. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var result = 0;
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func minus(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    
    func calculate(args:[String]) -> Int {
            
    // Todo: Calculate Result from the arguments.
        
    while args.count > 1 {
        if args.contains("x") || args.contains("/")  {
            // check if args have multiply or divide, do it first
            for (i,value) in args.enumerated()  {
                
                    if value == "x" || value == "/"  {
                        
                        if value == "x"{
                            
                            result = multiply(no1: Int(args[i - 1])!, no2: Int(args[i + 1])!)
                            
                        }
                        else if value == "/" {
                            
                            result = divide(no1: Int(args[i - 1])!, no2: Int(args[i + 1])!)
                            
                        }
                        var int = args
                        int.remove(at: i)
                        int.insert(String(result), at: i)
                        int.remove(at: i + 1)
                        int.remove(at: i - 1)
                        return calculate(args: int)
                        
                    }
                }
            }
            else {
            //then do add and minus 
                for (i,value) in args.enumerated() {
                    
                    if value == "+" || value == "-"{
                        
                        if value == "+"{
                            
                            result = add(no1: Int(args[i - 1])!, no2: Int(args[i + 1])!)
                            
                        }
                        else if value == "-"{
                            
                             result = minus(no1: Int(args[i - 1])!, no2: Int(args[i + 1])!)
                            
                        }
                        var int = args
                        int.remove(at: i)
                        int.insert(String(result), at: i)
                        int.remove(at: i + 1)
                        int.remove(at: i - 1)
                        return calculate(args: int)
                    }
                }
            }
            
        }
    return result
    
    }
   
}
