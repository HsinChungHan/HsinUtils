//
//  TimerManager.swift
//  RankingSystem
//
//  Created by Chung Han Hsin on 2020/5/15.
//  Copyright © 2020 Chung Han Hsin. All rights reserved.
//

import Foundation

public protocol TimerManagerDataSource: AnyObject {
  func timerManagerTimeInterval(_ timerManager: TimerManager) -> TimeInterval
}

public protocol TimerManagerDelegate: AnyObject {
  func timerManagerFires(_ timerManager: TimerManager, timer: Timer)
  func timerManagerInvalidate(_ timerManager: TimerManager)
}

public class TimerManager {
  public static let shared = TimerManager()
  
  weak var dataSource: TimerManagerDataSource?
  weak var delegate: TimerManagerDelegate?
  
  fileprivate var timer: Timer?
  
  public func setupTimer() {
    guard let dataSource = dataSource else {
      fatalError("You have to set dataSource for ScrollTimer")
    }
    
    let timeInterval = dataSource.timerManagerTimeInterval(self)
    
    timer = Timer.init(timeInterval: timeInterval, target: self, selector: #selector(onTimerFires(sender:)), userInfo: nil, repeats: true)
    RunLoop.current.add(timer!, forMode: .common)
  }
  
  @objc func onTimerFires(sender: Timer) {
    delegate?.timerManagerFires(self, timer: sender)
  }
  
  public func invalidateTimer() {
    if let _ = timer {
      timer!.invalidate()
    }
    timer = nil
    delegate?.timerManagerInvalidate(self)
  }
}
