import SwiftUI
import Firebase

struct RootView: View {
  @EnvironmentObject var authModel: AuthModel
  
  var body: some View {
    NavigationView {
      if authModel.isUserLoggedIn {
        NotesListView()
      } else {
        AuthView()
      }
    }
  }
}
