//
//  Checklist.swift
//  Checklists
//
//  Created by Pranay Katta on 2019-05-06.
//  Copyright © 2019 chickenfingers. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]()
    var iconName: String

    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }

    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
