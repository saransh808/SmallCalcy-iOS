//
//  ViewController.swift
//  Small Calcy
//
//  Created by Saransh Agarwal on 03/02/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    
    @IBOutlet weak var calScreenViewString: UILabel!
    
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var historyTable: UITableView!
    
    var calcy : Calculator = Calculator()
    var lastOperator : String = ""
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(calcy.calculationHistory.count)
        return calcy.calculationHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = calcy.calculationHistory[indexPath.row]
        return cell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.isHidden = true
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
//        historyTable.reloadData()
        if(historyTable.isHidden){
            
            
            historyButton.setTitle("Advanced - Show History", for: UIControl.State.normal)
            historyTable.isHidden = false
        }else{
            historyTable.isHidden = true
            historyButton.setTitle("Standard - No History", for: UIControl.State.normal)
        }
        
        
        
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
        historyTable.reloadData()
        
    }
    
    @IBAction func clearCalculationOnScreen(_ sender: Any) {
        self.calScreenViewString.text = ""
        
    }
    
}

