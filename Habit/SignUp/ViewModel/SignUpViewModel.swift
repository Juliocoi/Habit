import SwiftUI

class SignUpViewModel: ObservableObject {
  @Published var uiState: SignUpUIState = .none
  
  func signUp(){
    self.uiState = .loading
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
//      self.uiState = .error("user already exist")
      self.uiState = .goToHomeScreen
    }
  }
  
}

extension SignUpViewModel {
  func homeView () -> some View {
    return SignUpViewRouter.makeHomeView()
  }
}
