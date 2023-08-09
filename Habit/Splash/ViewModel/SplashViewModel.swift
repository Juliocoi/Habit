import SwiftUI

import SwiftUI

class SplashViewModel: ObservableObject {
  
  @Published var uiState: SplashUIState = .loading
  
  func onAppear() {
    // faz algo assincrono e muda o estado da uiState
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
     // aqui é chamado depois de 2 segundos
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

//class SplashViewModel: ObservableObject {
//
//  @Published var uiState: SplashUIState = .loading
//
//  func onAppear(){
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
////      self.uiState = .error("Erro no servidor")
//      self.uiState = .goToSignInScreen
//    }
//  }
//}
//
//extension SplashViewModel {
//  func signInView() -> some View {
//    return SplashViewRouter.makeSignInView()
//  }
//}
