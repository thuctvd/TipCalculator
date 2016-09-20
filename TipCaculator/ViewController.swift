//
//  ViewController.swift
//  TipCaculator
//
//  Created by Truong Vo Duy Thuc on 9/14/16.
//  Copyright © 2016 testcoma2a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  let tipRates = [0.15, 0.2, 0.25]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tipLabel.text = "$0"
    totalLabel.text = "$0"
    billTextField.clearButtonMode = UITextFieldViewMode.whileEditing
    
    //load default setting
    tipControl.selectedSegmentIndex = Globals.getDefaultTipRate()
    
    //load last bill
    let lastBill = Globals.getLastBill()
    if lastBill != 0 {
      billTextField.text = "\(lastBill)"
      calculateTip(billTextField)
    }
    else{
      billTextField.text = "";
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    billTextField.becomeFirstResponder()
    UIView.animate(withDuration: 0.7, animations: {
      self.billTextField.center.x -= self.view.bounds.width
      self.tipLabel.center.x -= self.view.bounds.width
      self.totalLabel.center.x -= self.view.bounds.width
    })
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    tipControl.selectedSegmentIndex = Globals.getDefaultTipRate()
    calculateTip(billTextField)
    updateUIByTheme(themeId: Globals.CURRENT_THEME)
    
    self.billTextField.center.x += view.bounds.width
    self.tipLabel.center.x += view.bounds.width
    self.totalLabel.center.x += view.bounds.width
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  
  @IBAction func onTap(_ sender: AnyObject) {
  }

  @IBAction func onSelectTipRate(_ sender: AnyObject) {
    calculateTip(sender)
  }
  
  @IBAction func calculateTip(_ sender: AnyObject) {
    let bill = Double(billTextField.text!) ?? 0
    let tip = bill * tipRates[tipControl.selectedSegmentIndex]
    let total = bill + tip
    
    tipLabel.text = "\(Globals.getCurrency())\(Globals.formatNumber(val: tip))"
    totalLabel.text = "\(Globals.getCurrency())\((Globals.formatNumber(val: total)))"
    
    Globals.saveLastBill(val: bill)
  }
  
  func updateUIByTheme(themeId:Int) {
    if themeId > 0 {
      self.view.backgroundColor = UIColor.cyan
    }
    else {
      self.view.backgroundColor = UIColor.white
    }
  }
  
}
