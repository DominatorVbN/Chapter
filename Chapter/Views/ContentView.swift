//
//  ContentView.swift
//  Chapter
//
//  Created by Amit Samant on 15/04/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore

    var body: some View {
        NavigationView {
            NoteListView()
                .navigationBarTitle(Text("Notes"))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { self.dataStore.addNote() }
                        }
                    ) {
                        Image(systemName: "plus")
                    }
                )
            NoNoteView()
        }
    }
}
