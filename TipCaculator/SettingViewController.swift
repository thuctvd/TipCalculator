//
//  SettingViewController.swift
//  TipCaculator
//
//  Created by Truong Vo Duy Thuc on 9/19/16.
//  Copyright © 2016 testcoma2a. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

  @IBOutlet weak var themeControl: UISegmentedControl!
  @IBOutlet weak var tipControl: UISegmentedControl!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    tipControl.selectedSegmentIndex = Globals.getDefaultTipRate()
    themeControl.selectedSegmentIndex = Globals.CURRENT_THEME
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  @IBAction func saveTipRate(_ sender: AnyObject) {
    Globals.saveDefaultTipRate(val: tipControl.selectedSegmentIndex)
  }

  @IBAction func changeTheme(_ sender: AnyObject) {
    updateUIByTheme(themeId: themeControl.selectedSegmentIndex)
    Globals.CURRENT_THEME = themeControl.selectedSegmentIndex
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateUIByTheme(themeId: Globals.CURRENT_THEME)
  }
  
  func updateUIByTheme(themeId:Int) {
    if themeId > 0 {
      self.view.backgroundColor = UIColor.cyan
    }
    else {
      self.view.backgroundColor = UIColor.white
    }

  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
