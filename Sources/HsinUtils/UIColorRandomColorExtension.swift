//
//  File.swift
//  
//
//  Created by Chung Han Hsin on 2020/5/16.
//

import UIKit

public extension UIColor {
  static func makeRandomColor() -> UIColor {
    return UIColor(displayP3Red: CGFloat(Int.random(in: 0...255))/CGFloat(255), green: CGFloat(Int.random(in: 0...255))/CGFloat(255), blue: CGFloat(Int.random(in: 0...255))/CGFloat(255), alpha: 1.0)
  }
}
