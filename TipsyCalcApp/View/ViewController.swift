//
//  ViewController.swift
//  TipsyCalcApp
//
//  Created by Alwin on 7/27/18.
//  Copyright © 2018 RS Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()

    }
    
    func setTipCalculationValues() {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }
    
    func updateUI() {
        tipLbl.text = String(format: "$%0.2f", tip.tipAmount)
        totalLbl.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
    }
    
    @IBAction func billAmountDidChange(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
        print("My Value changed!")
    }
    @IBAction func tipPercentageDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
        print(tipPercentageSlider.value)
    }
}

