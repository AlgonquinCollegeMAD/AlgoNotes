import SwiftUI
import Firebase

struct AuthView: View {
  @EnvironmentObject var authModel: AuthModel
  @State var email = String()
  @State var password = String()
  
  var body: some View {
    VStack {
      
      // Email field
      TextField("Email", text: $email)
        .textInputAutocapitalization(.never)
        .frame(height: 30)
        .padding()
        .background(
          Capsule()
            .foregroundColor(.gray.opacity(0.2))
        )
      
      // Password field
      SecureField("Password", text: $password)
        .frame(height: 30)
        .padding()
        .background(
          Capsule()
            .foregroundColor(.gray.opacity(0.2))
        )
      
      // Buttons
      HStack() {
        Button(action: {
          authModel.login(withEmail: email, password: password)
        }) {
          Text("Login")
        }
        .padding()
        
        Button(action: {
          authModel.register(email: email, password: password)
        }){
          Text("Sign Up")
        }
        .padding()
      }
    }
    .padding()
  }
}

#Preview {
  AuthView()
}
