import SwiftUI
import Firebase

struct NotesListView: View {
  @EnvironmentObject var model: NotesModel
  @State var showAddNewNoteView = false
  @State var note: Note? = nil
  
  var body: some View {
    List(model.notes, id: \.id) { note in
      Text(note.title)
        .onTapGesture {
          self.note = note
          showAddNewNoteView.toggle()
        }
    }
    .navigationTitle("Notes")
    .toolbar {
      ToolbarItem {
        Button {
          self.note = Note()
          showAddNewNoteView.toggle()
        } label: {
          Image(systemName: "note.text.badge.plus")
        }
      }
    }
    .sheet(item: $note) { note in
      NoteView(note: note)
    }
  }
}
