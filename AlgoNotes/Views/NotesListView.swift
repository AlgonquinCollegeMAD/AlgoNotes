import SwiftUI
import Firebase

struct NotesListView: View {
  @EnvironmentObject var model: NotesModel
  @State var showAddNewNoteView = false
  
  var body: some View {
    List(model.notes, id: \.id){ note in
      Text(note.title)
    }
    .navigationTitle("Notes")
    .toolbar {
      ToolbarItem {
        Button {
          showAddNewNoteView.toggle()
        } label: {
          Image(systemName: "note.text.badge.plus")
        }
      }
    }
    .sheet(isPresented: $showAddNewNoteView) {
      let note = Note(title: "", text: "")
      NoteView(note: note)
    }
  }
}
