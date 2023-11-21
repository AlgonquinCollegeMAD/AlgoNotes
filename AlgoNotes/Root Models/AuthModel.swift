import SwiftUI
import Firebase

class AuthModel: ObservableObject {
  @Published var isUserLoggedIn = false
  
  init() {
    Auth.auth().addStateDidChangeListener { auth, user in
      self.isUserLoggedIn = user != nil
    }
  }
  
  func register(email: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if error != nil{
        print(error?.localizedDescription ?? "")
      } else {
        print("Sign Up Successful")
      }
    }
  }
  
  func login(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if error != nil {
        print(error?.localizedDescription ?? "")
      } else {
        print("Login successful")
      }
    }
  }
  
  func logout() {
    do {
      try Auth.auth().signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
  }
}
