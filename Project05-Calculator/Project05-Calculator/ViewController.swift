//
//  ViewController.swift
//  Project05-Calculator
//
//  Created by space on 2018/4/22.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var number = ""         //
    var beforeNums : Double = 0;     //点击操作符号之前的数字
    var calOperator = "";   //操作符号
    
    /// 清零的按钮
    ///
    /// - Parameter sender:
    @IBAction func clearNums(_ sender: AnyObject) {
        display.text = "0"
        number = "";
        calOperator = ""
        beforeNums = 0
    }
    
    
    /// 数字的按钮，拼接功能
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func appendDigit(_ sender: AnyObject) {
        let digit = sender.currentTitle!!
        number += digit
        print("串:\(number)")
        display.text = number
        
    }
    /// 对符号进行操作
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func symbolPress(_ sender: AnyObject) {
        let digit = sender.currentTitle!!
        switch digit {
        case "=":
            //在此调用函数
            let temp : Double? = Double(number)
            let result = calculateLogic(beforeNum: beforeNums, number: temp!, calOperator: calOperator)
            beforeNums = result
            display.text = "\(beforeNums)"
            number = "\(beforeNums)"
            calOperator = ""
            
            print("符号是等于")
        default:
            
            if calOperator != "" {
                //调用函数
                
                let temp : Double? = Double(number)
                let result = calculateLogic(beforeNum: beforeNums, number: temp!, calOperator: calOperator)
                beforeNums = result
                display.text = "\(beforeNums)"
                calOperator = ""
                
                
            } else {
            
                calOperator = digit //进行数字转化
                let temp : Double? = Double(number)
                beforeNums = temp!
                display.text = ""
                number = ""
                
                print("数字：\(beforeNums)")
            }
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.layer.borderWidth = 1;
    }
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /// 计算部分的逻辑
    ///
    /// - Parameters:
    ///   - beforeNum: 前面的数字
    ///   - number: 后面的数字
    ///   - operator: 操作符号
    /// - Returns: 返回的计算结果
    func calculateLogic(beforeNum:Double , number : Double, calOperator:String) -> Double {
        var result : Double = 0
        switch calOperator {
        case "+" :
            print("加法")
            result = beforeNum + number
        case "-" :
            result = beforeNum - number
        case "X" :
            result = beforeNum * number
        case "÷" :
            result = beforeNum / number
        default:
            print("无")
        }
        return result
    }
}

