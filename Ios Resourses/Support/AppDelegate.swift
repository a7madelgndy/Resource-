//
//  AppDelegate.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 10/04/2025.
//

import UIKit
import UserNotifications
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        authForNotification()
        
        return true
    }
    
    
    func authForNotification() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        let authOption = UNAuthorizationOptions(arrayLiteral: .alert, .sound  , .badge)
        center.requestAuthorization(options: authOption, completionHandler: { (scuccess , error) in
            if let error {
                print(error.localizedDescription)
                return
            }
              print(scuccess.description)
        })
        
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate:UNUserNotificationCenterDelegate {
    //This method will be invoked when the local notification is posted and the app is still running
    //You won’t do anything just return in the completionhanler how do you want the to present the notification
    //When your app is active and in the foreground, it is supposed to handle any fired
    //notifications on its own.
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        print("Received notification in foreground: \(notification)")
        
        // Choose how to present the notification while app is in foreground
        completionHandler([.banner, .badge])
    }

    
    

}

