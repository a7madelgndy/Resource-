//
//  ViewController.swift
//  Ios Resourses
//
//  Created by Ahmed El Gndy on 10/04/2025.
//

import UIKit

class LocalNotifaction: UIViewController {
    let actionButton = UIButton()
    
    var notification: UNUserNotificationCenter?
    var notificationContent  : UNNotificationContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        
        notification = UNUserNotificationCenter.current() // looks like singleTon

        
        // 1- Take user Authorizaiton (we would like to send you notificatuon allow or not allow )
        // in the appDelegate

        actionButton.addTarget(self, action: #selector(makeANotification), for:  .touchUpInside)
    }
    
    @objc func makeANotification() {
        createNotificationToUser()
    }
    
    
    func createNotificationToUser(){
        //Content
        let content = UNMutableNotificationContent()
        content.title = "important Meeting"
        content.body = "please join our meeting"
        content.badge = 39
        content.sound = UNNotificationSound.defaultRingtone
        
        //add attachment to the notification = image
        if let url = Bundle.main.url(forResource: "done", withExtension: "jpg") {
            if let attachment = try? UNNotificationAttachment(identifier: "1", url: url) {
                content.attachments = [attachment]
            }
        }
        
       //Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10 , repeats: false)
        
        //Reguest
        let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
        
        //add resuest to notification
        notification?.add(request) { error in
            if let error {
                print(error.localizedDescription)
            }
         }
    }

}






extension LocalNotifaction {
    func configureButton() {
        actionButton.configuration = .tinted()
        actionButton.configuration?.cornerStyle = .capsule
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.configuration?.title = "Notification Button"
        actionButton.configuration?.image = UIImage(systemName: "paperplane")
        view.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    
            
        ])
    }
}
