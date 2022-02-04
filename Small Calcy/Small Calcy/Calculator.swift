//
//  Calculator.swift
//  Small Calcy
//
//  Created by Saransh Agarwal on 03/02/22.
//

import Foundation


class Calculator{
    var currentCalculation : String = ""
    var result : Int = 0
    var calculationHistory : [String] = []
    var currentOperatorsAndOperands : [String] = []
    
    func resetResult(){
        self.result = 0;
        self.currentCalculation = "";
        self.currentOperatorsAndOperands.removeAll()
        printAllHistoryOnConsole()
    }
    
    func pushHistory(s : String){
        self.calculationHistory.append(s)
    }
    
    
    func push(s : String){
        self.currentOperatorsAndOperands.append(s)
        print(self.currentOperatorsAndOperands)
    }
    
    
    func calc()->Bool{
        var localRes : Int = 0
        var localNum : Int = 0
        var localOp : String = ""
        var expectNumber : Bool = true
        var isNumber : Bool = true
        for op in self.currentOperatorsAndOperands{
            if(op.count == 1){
                isNumber = isNumberValue(s:op)
                if(expectNumber && isNumber){
                    localNum = getNumberValue(s: op)
                    if(localOp == ""){
                        localRes = localNum
                    }else if(localOp == "+"){
                        localRes = localRes + localNum
                    }else if(localOp == "-"){
                        localRes = localRes - localNum
                    }else if(localOp == "x"){
                        localRes = localRes * localNum
                    }else if(localOp == "/"){
                        localRes = localRes / localNum
                    }
                    expectNumber = false
                }else if(expectNumber && !isNumber){
                    return false
                }else if(!expectNumber && isNumber){
                    return false
                }else{
                    if(op == "+"){
                        localOp = "+"
                    }else if(op == "-"){
                        localOp = "-"
                    }else if(op == "x"){
                        localOp = "x"
                    }else if(op == "/"){
                        localOp = "/"
                    }
                    expectNumber = true
                }
            }else{
                return false
            }
        }
        self.result = localRes
        self.currentOperatorsAndOperands.removeAll()
        return true
        
    }
    
    func isNumberValue(s:String)->Bool{
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(s).isSubset(of: nums)
    }
    
    func getNumberValue(s:String)->Int{
        return Int(s) ?? 0
    }

    func getResult() -> Int{
        return self.result
    }
    
    func printAllHistoryOnConsole(){
        print("Show history button clicked!")
        for calculation in calculationHistory{
            print(calculation)
        }
    }
}
