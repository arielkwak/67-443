//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Ariel Kwak on 9/4/23.
//

import Foundation
class Stopwatch {
  
  private var startTime: NSDate?

  func start() {
    startTime = NSDate()
  }

  func stop() {
    startTime = nil
  }
   
  var elapsedTime: TimeInterval {
    if let startTime = self.startTime {
      return -1 * startTime.timeIntervalSinceNow // could also just say -startTime.timeIntervalSinceNow
    } else {
      return 0
    }
  }
  
  var elapsedTimeAsString: String {
    if let startTime = startTime {
        // Calculate elapsed time in seconds
        let elapsedTime = -startTime.timeIntervalSinceNow  // Use - to ensure a positive elapsed time

        // Calculate minutes, seconds, and tenths of a second
        let minutes = Int(elapsedTime / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        let tenthsOfASecond = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 10)

        // Create a formatted string
        return String(format: "%02d:%02d.%d", minutes, seconds, tenthsOfASecond)
    } else {
        // Handle the case when startTime is nil
        return "00:00.0"
    }
  }
  
  var isRunning: Bool {
      return startTime != nil
  }

}
