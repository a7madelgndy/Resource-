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
        auth()
        
        //2 - the content Notification Conent
        notificationContent     = createNotificationContent()

        actionButton.addTarget(self, action: #selector(makeNotification), for:  .touchUpInside)
    }
    
    @objc func makeNotification() {
      //3- Creat notification Request
        if let notificationContent {
            createNotificationRequest(withContent: notificationContent)
        }
        
    }
    
    func auth() {
        let authOption = UNAuthorizationOptions(arrayLiteral: .alert, .sound  , .badge)
        notification?.requestAuthorization(options: authOption, completionHandler: { (scuccess , error) in
            if let error {
                print(error.localizedDescription)
            }
        })
    }
    
    func createNotificationContent() -> UNMutableNotificationContent{
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "important Meeting"
        notificationContent.body = "please join our meeting"
        notificationContent.badge = 1
        
        //add attachment to the notification = image
        if let url = Bundle.main.url(forResource: "panda", withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(identifier: "1", url: url) {
                notificationContent.attachments = [attachment]
            }
        }
      return notificationContent
    }

    func createNotificationRequest(withContent content: UNNotificationContent ){
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
        
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
