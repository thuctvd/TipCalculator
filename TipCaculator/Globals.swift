//
//  Globals.swift
//  TipCaculator
//
//  Created by Truong Vo Duy Thuc on 9/19/16.
//  Copyright © 2016 testcoma2a. All rights reserved.
//

import Foundation
class Globals {
  static let TIP_DEFAULT_KEY = "default_tip"
  static let LAST_BILL_VALUE_KEY = "last_bill_value"
  static let LAST_BILL_TIME_KEY = "last_bill_time"
  
  static var CURRENT_THEME = 0
  
  static func saveDefaultTipRate(val:Int) {
    let defaults = UserDefaults.standard
    defaults.set(val, forKey: TIP_DEFAULT_KEY)
    defaults.synchronize()
  }
  
  static func getDefaultTipRate()->Int {
    let defaults = UserDefaults.standard
    let rate = defaults.integer(forKey: TIP_DEFAULT_KEY)
    return rate
  }
  
  static func saveLastBill(val:Double) {
    let defaults = UserDefaults.standard
    defaults.set(val, forKey: LAST_BILL_VALUE_KEY)
    defaults.set(NSDate(), forKey: LAST_BILL_TIME_KEY)
    defaults.synchronize()
  }
  
  static func getLastBill() -> Double {
    let defaults = UserDefaults.standard
    
    let lastBill = defaults.double(forKey: LAST_BILL_VALUE_KEY)
    let lastTime = defaults.object(forKey: LAST_BILL_TIME_KEY)
    if lastTime == nil{
      return 0
    }
    
    let curDate = NSDate()
    let timeCompared = curDate.timeIntervalSince((lastTime as! NSDate) as Date)
    let timeout = timeCompared / 60.0;
    if timeout < 10{
      return lastBill
    }
    return 0
  }
  
  static func getCurrency() -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.locale = Locale.current
    return formatter.currencySymbol
  }
  
  static func formatNumber(val: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.locale = Locale.current
    return formatter.string(for: val)!
  }
}
