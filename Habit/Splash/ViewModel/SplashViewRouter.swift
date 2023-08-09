// aqui ficarão as rotas para as telas que se relacionam com a splash View
import SwiftUI

enum SplashViewRouter {
  static func makeSignInView() -> some View{
    let viewModel = SignInViewModel()
    return SignInView(viewModel: viewModel)

  }
}
