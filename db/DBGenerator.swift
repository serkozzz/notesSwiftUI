//
//  DBGenerator.swift
//  CoreDataSandbox
//
//  Created by Sergey Kozlov on 27.07.2025.
//


import CoreData

@MainActor
class DBGenerator {
    func generateIfNeeded() {
        
        let fetchRequest = Note.fetchRequest()
        let count = try? CoreDataStack.shared.managedContext.count(for: fetchRequest)
        
        guard let cellsCount = count, cellsCount == 0 else { return }
        
        generate()
    }
    
    private func generate() {
        let context = CoreDataStack.shared.managedContext
        
        let note = Note(context: context)
        note.name = "First note"
        note.text = "descripton"
        note.lastChanged = Date()
        try! context.obtainPermanentIDs(for: [note])
        try! context.save()
    }
}
