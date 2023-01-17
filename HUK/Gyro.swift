//
//  Gyro.swift
//  HUK
//
//  Created by Kushal Chigati on 1/12/23.
//

import SwiftUI
import CoreMotion

let motion = CMMotionManager()
var timer = Timer?

func startGyros() {
   if motion.isGyroAvailable {
      motion.gyroUpdateInterval = 1.0 / 60.0
      motion.startGyroUpdates()

      // Configure a timer to fetch the accelerometer data.
      timer = Timer(fire: Date(), interval: (1.0/60.0),
             repeats: true, block: { (timer) in
         if let data = motion.gyroData {
            let x = data.rotationRate.x
            let y = data.rotationRate.y
            let z = data.rotationRate.z

            // Use the gyroscope data in your app.
         }
      })

      // Add the timer to the current run loop.
      RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
   }
}


func stopGyros() {
   if timer != nil {
      timer?.invalidate()
      timer = nil
      motion.stopGyroUpdates()
   }
}

struct GyroView: View {
    var body: some View {
        Button(action: {
            startGyros()
        }) {
            Text("Gyro Data")
        }
    }
}

struct GyroView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
