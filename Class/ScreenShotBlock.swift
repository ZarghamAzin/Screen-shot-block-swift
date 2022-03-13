//
//  ScreenShotBlock.swift
//  Class
//
//  Created by Javad on 3/10/22.
//

import Foundation
import UIKit

var counterScreen = 0

func ScreenshotBlock(){
    
    NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: OperationQueue.main) { notification in
        
        print("Screenshot taken!")
        
        counterScreen = UserDefaults.standard.object(forKey: "counter") as? Int ?? 0
        counterScreen += 1
        
        UserDefaults.standard.set(counterScreen, forKey: "counter")
        
        let finalCounterScreen = UserDefaults.standard.object(forKey: "counter") as! Int
        
        print("Nuber Of ScreenShots That User Taking \(String(describing: UserDefaults.standard.object(forKey: "counter")))")
        
        
        switch finalCounterScreen {
            
        case 5 ... 7:
            
            showAlertToUserDoNotTakeScreenShot()
            
        case 7 ... 1000:
            
            BlockUserRequest()
            showAlertToUserHasBlocked()
            
        default:
            print("There is no Problem")
        }
    }
}


