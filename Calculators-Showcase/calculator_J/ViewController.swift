//
//  ViewController.swift
//  calculator_J
//
//  Created by Yunhan Zhan on 5/4/20.
//  Copyright © 2020 Yunhan Zhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
   
    var performingMath = false //To check if we hit a number and start calculating
    var operation = 0
    
    var decimalUsed = false //dot can be used once in a number
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print ("###Calculating###")
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func Operators(_ sender: UIButton) {
        
        decimalUsed = false // allow to start press operator
        
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 18 {
            
            previousNumber = Double(resultLabel.text!)!
            
            if sender.tag == 12{
                
                //divide
                resultLabel.text = "/"
                
            }
            else if sender.tag == 13{
                
                //multiply
                resultLabel.text = "x"
                
            }
            else if sender.tag == 14{
                
                //minus
                resultLabel.text = "-"
                
            }
            else if sender.tag == 15{
                
                //plus
                resultLabel.text = "+"
                
            }
            
    
         operation = sender.tag
         performingMath = true
            
        }
            
        else if sender.tag == 11{
            // clear all the values
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            decimalUsed = false
            
        }
            
        else if sender.tag == 16 {
             //press = start calculating
            
             if operation == 12 && numberOnScreen != 0 {
                
                //divide, check if denominator is 0
                
                resultLabel.text = String(previousNumber / numberOnScreen)
                
            }
             else if operation == 12 && numberOnScreen == 0{
                
                resultLabel.text = String("*Can't Divide Zero*")
                
             }
            else if operation == 13{
                
                //multiply
                resultLabel.text = String(previousNumber * numberOnScreen)
                
            }
            else if operation == 14{
                
                //minus
                
                resultLabel.text = String(previousNumber - numberOnScreen)
                
            }
            else if operation == 15{
                
                //add
                
                resultLabel.text = String(previousNumber + numberOnScreen)
                
            }
            decimalUsed = false
        }
            
        else if sender.tag == 18 {
            
            //%
            resultLabel.text = String(numberOnScreen * 0.01)
            
        }

        
    }
        
    @IBAction func Numbers(_ sender: UIButton) {
        
        if performingMath == true{
            
            
            if decimalUsed == true && sender.tag == 20{
                resultLabel.text = ""
            }
            
            resultLabel.text = String(sender.tag-1)
            numberOnScreen = Double(resultLabel.text!)!;
            
            performingMath = false
            
            
        }
        else{
            
            resultLabel.text = resultLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(resultLabel.text!)!;
            
        }
        if sender.tag == 20{
            decimalUsed = true
        }
    }
    
    @IBAction func Decimal(_ sender: UIButton) {
        resultLabel.text = "."
    }
    
}




