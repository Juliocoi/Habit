import Foundation

enum SignInUIState {
  case none
  case loading
  case goToHomeScreem
  case error(String)
}

// para que isso funcione eu preciso pegar o campo de e-mail e senha no evento de click do botão e fazer o viewModel exibir as informações na view e fazer a requisição web
