import SwiftUI
import Firebase

struct NotesListView: View {
  @EnvironmentObject var notesModel: NotesModel
  @EnvironmentObject var authModel: AuthModel
  @State var showAddNewNoteView = false
  @State var note: Note? = nil
  
  var body: some View {
    List {
      ForEach(notesModel.notes, id: \.id) { note in
        Text(note.title)
          .onTapGesture {
            self.note = note
            showAddNewNoteView.toggle()
          }
      }
      .onDelete(perform: { indexSet in
        notesModel.delete(atOffsets: indexSet)
      })
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
      ToolbarItem {
        Button {
          authModel.logout()
        } label: {
          Text("Logout")
        }
      }
    }
    .sheet(item: $note) { note in
      NoteView(note: note)
    }
  }
}
