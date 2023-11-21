import SwiftUI
import Firebase

class NotesModel: ObservableObject {
  @Published var notes: [Note] = []
  private let notesCollectionRef = Firestore.firestore().collection("Notes")
  
  init() {
    startListening()
  }
  
  func startListening() {
    notesCollectionRef.addSnapshotListener { (snapshot, error) in
      guard let documents = snapshot?.documents else {
        print("No notes")
        return
      }
      
      self.notes = documents.map { snapshot -> Note in
        let data = snapshot.data()
        let id = data["id"] as? String ?? ""
        let title = data["title"] as? String ?? ""
        let text = data["text"] as? String ?? ""
        
        return Note(
          id: id,
          title: title,
          text: text
        )
      }
    }
  }
  
  func delete(atOffsets: IndexSet) {
    atOffsets.map { notes[$0] }.forEach { note in
      notesCollectionRef.document(note.id).delete() { error in
        if let error = error {
          print("Error: \(error)")
        } else {
          print("Note deleted")
        }
      }
    }
  }
  
  func saveNote(note: Note){
    let ref = notesCollectionRef.document(note.id)
    
    ref.setData(
      [
        "id": note.id,
        "title": note.title,
        "text":note.text
      ]
    ) {
      error in
      if let error = error {
        print(error.localizedDescription)
      }
    }
  }
}
