//
//  ContentView.swift
//  Notes
//
//  Created by Sergey Kozlov on 29.07.2025.
//

import SwiftUI

struct NotesView: View {
    @FetchRequest(entity: Note.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Note.lastChangedValue, ascending: false)])
    var notes: FetchedResults<Note>
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List() {
                    ForEach(notes) { note in
                        NavigationLink{
                            DetailsView(note: note)
                        } label: {
                            Text(note.name)
                        }
                    }
                    .onDelete(perform: removeNote)
                    
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        addNewNote()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func addNewNote() {
        let note = Note(context: CoreDataStack.shared.managedContext)
        note.name = "new note"
        note.text = "text"
        note.lastChanged = Date()
        CoreDataStack.shared.saveContext()
    }
    
    private func removeNote(indecies: IndexSet) {
        let notesToDelete = indecies.map {i in notes[i] }
        for note in notesToDelete {
            CoreDataStack.shared.managedContext.delete(note)
        }
    }
}

#Preview {
    NotesView()
        .environment(\.managedObjectContext, CoreDataStack.shared.managedContext)
}
