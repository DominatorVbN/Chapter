//
//  NoteListView.swift
//  Chapter
//
//  Created by Amit Samant on 15/04/25.
//

import SwiftUI
import CRDTSwift

struct NoteListView: View {
    @EnvironmentObject var dataStore: DataStore

    var body: some View {
        List {
            ForEach(dataStore.noteBook.notes) { note in
                NavigationLink(
                    destination: NoteView(note: self.dataStore.noteBinding(forId: note.id))
                ) {
                    HStack {
                        Image(systemName: "book.pages")
                            .font(.system(size: 30, weight: .light))
                        VStack(alignment: .leading) {
                            Text(note.displayedTitle)
                                .font(.headline)
                            Text(note.tagsString)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        PriorityView(priority: note.priority.value)
                    }
                    .padding(10)
                }
            }
            .onDelete { indices in
                indices.forEach { self.dataStore.deleteNote(at: $0) }
            }
            .onMove { sources, destination in
                dataStore.noteBook.moveNote(from: sources.first!, to: destination)
            }
        }
    }
}
