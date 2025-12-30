//
//  NotesApp.swift
//  Notes
//
//  Created by Sergey Kozlov on 29.07.2025.
//

import SwiftUI

@main
struct NotesApp: App {
    
    init() {
        DBGenerator().generateIfNeeded()
    }
    
    var body: some Scene {
        WindowGroup {
            NotesView()
                .environment(\.managedObjectContext, CoreDataStack.shared.managedContext)
        }
    }
}
