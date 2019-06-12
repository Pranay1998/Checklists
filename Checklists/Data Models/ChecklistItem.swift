//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Pranay Katta on 2019-05-03.
//  Copyright © 2019 chickenfingers. All rights reserved.
//

import UIKit
import UserNotifications

class ChecklistItem: NSObject, Codable {
    
    var text: String
    var checked: Bool
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
        self.itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    deinit {
        removeNotification()
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
    func scheduleNotification() {
        removeNotification()
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = .default
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled \(request) for itemID: \(itemID)")
        }
    }
    
    func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["\(itemID)"])
    }
}
