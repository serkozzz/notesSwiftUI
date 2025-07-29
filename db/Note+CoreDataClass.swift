//
//  Note+CoreDataClass.swift
//  Notes
//
//  Created by Sergey Kozlov on 29.07.2025.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    var name: String {
        get { nameValue! }
        set { nameValue = newValue }
    }
    
    var text: String {
        get { textValue! }
        set { textValue = newValue }
    }
    
    var lastChanged: Date {
        get { lastChangedValue! }
        set { lastChangedValue = newValue }
    }
}
