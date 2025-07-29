//
//  DetailView.swift
//  Notes
//
//  Created by Sergey Kozlov on 30.07.2025.
//

import SwiftUI

struct DetailsView: View {
    
    var note: Note
    
    var body: some View {
        VStack {
            TextField("owner", text: Binding<String> (
                get: { note.name },
                set: { newValue in
                    note.name = newValue
                    addNote()
                }))
            
            TextEditor(text: Binding<String> (
                get: { note.text },
                set: { newValue in
                    note.text = newValue
                    addNote()
                }))
        }
    }
    
    func addNote() {
        note.lastChanged = Date()
        try! note.managedObjectContext?.save()
    }
}
