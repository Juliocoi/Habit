import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
  
  var publisher: PassthroughSubject<Bool, Never>!
  
  @Published var uiState: SignUpUIState = .none
  
  func signUp(){
    self.uiState = .loading
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
//      self.uiState = .error("user already exist")
      self.uiState = .success
      self.publisher.send(true)
    }
  }
}

//extension SignUpViewModel {
//  func homeView () -> some View {
//    return SignUpViewRouter.makeHomeView()
//  }
//}
