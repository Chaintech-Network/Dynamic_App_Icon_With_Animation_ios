//
//  IconAnimatorHandler.swift
//  DynamicAppIcons
//
//  Created by Puneet Bhagat02 on 01/08/24.
//

import SwiftUI

class IconAnimatorHandler {
    
   let iconNames: [String] =
    [
       "chaintech-logo-01",
       "chaintech-logo-02",
       "chaintech-logo-03",
       "chaintech-logo-04"
    ]
    
    // An `IconAnimator` that runs at 4fps on the main thread
   private let iconAnimator = IconAnimator(
        numberOfFrames: 4,
        numberOfLoops: 4,
        iconsList:  [
            "chaintech-logo-01",
            "chaintech-logo-02",
            "chaintech-logo-03",
            "chaintech-logo-04"
         ],
        targetFramesPerSecond: 4,
        shouldRunOnMainThread: true
    )
    
    // A background task to keep our app alive while we're animating
   private var backgroundTask: UIBackgroundTaskIdentifier? = nil
    
    func performIconAnimation() {
        backgroundTask = UIApplication.shared.beginBackgroundTask()
        
        DispatchQueue.main.asyncAfter(deadline: .now () + .seconds(3)) {
            self.startAnimation()
        }
    }
    
   private func startAnimation() {
        // Start the animation
        iconAnimator.startAnimation() { [weak self] in
            // Once the animation is complete,
            // end our background task so that iOS knows
            // that our app has finished its work
            if let backgroundTask = self?.backgroundTask {
                UIApplication.shared.endBackgroundTask(backgroundTask)
            }
            self?.backgroundTask = nil
        }
        
    }
    
    
    func changeAppIcon(to iconName: String, callback: @escaping() -> Void) {
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                print("Error setting alternate icon \(error.localizedDescription)")
            }
            callback()
        }
    }
    
}
