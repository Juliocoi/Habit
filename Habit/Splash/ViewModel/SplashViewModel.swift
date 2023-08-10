import SwiftUI

import SwiftUI

class SplashViewModel: ObservableObject {
  
  @Published var uiState: SplashUIState = .loading
  
  func onAppear() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//      self.uiState = .error("erro na resposta do servidor")
      self.uiState = .goToSignInScreen
    }
    print("OnApper sucess")
  }
  
}

extension SplashViewModel {
  func signInView() -> some View {
    return SplashViewRouter.makeSignInView()
  }
}
