import SwiftUI
import Firebase

struct RootView: View {
  @State var isUserLoggedIn = false
  
  var body: some View {
    NavigationView {
      if isUserLoggedIn {
        Text("List of all notes")
      } else {
        AuthView()
      }
    }
    .onAppear {
      Auth.auth().addStateDidChangeListener { auth, user in
        if user != nil {
          isUserLoggedIn.toggle()
        }
      }
    }
  }
}
