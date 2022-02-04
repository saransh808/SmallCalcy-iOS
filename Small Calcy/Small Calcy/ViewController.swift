//
//  ViewController.swift
//  Small Calcy
//
//  Created by Saransh Agarwal on 03/02/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var calScreenViewString: UILabel!
    
    
    var calcy : Calculator = Calculator()
    var lastOperator : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calScreenViewString.text = ""
    }
    
    @IBAction func getResult(_ sender: Any) {
        if calcy.calc(){
            self.calScreenViewString.text = "\(self.calScreenViewString.text ?? "") = \(calcy.getResult())"
            calcy.pushHistory(s: self.calScreenViewString.text ?? "")
        }else{
            self.calScreenViewString.text = "Invalid Input"
        }

    }
    
    @IBAction func showHistoryClicked(_ sender: Any) {
        calcy.printAllHistoryOnConsole()
    }
    @IBAction func inputAndCalculate(_ sender: Any) {
        let op : String = ((sender as! UIButton).titleLabel?.text)!
        if(lastOperator == "="){
            self.calScreenViewString.text = ""
            calcy.resetResult()
        }
        if(!(op == "=")){
            lastOperator = op
            calcy.push(s: op)
            self.calScreenViewString.text = "\(self.calScreenViewString.text ?? "") \(op)"
        }else{
            lastOperator = "="
        }
        
    }
    
    @IBAction func clearCalculationOnScreen(_ sender: Any) {
        self.calScreenViewString.text = ""
        
    }
    
}

