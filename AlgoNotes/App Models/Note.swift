import Foundation

class Note: Identifiable {
  let id: String
  var title: String
  var text: String
  
  init(
    id: String = UUID().uuidString,
    title: String,
    text: String
  ) {
    self.id = id
    self.title = title
    self.text = text
  }
  
  convenience init() {
    self.init(title: "", text: "")
  }
}
