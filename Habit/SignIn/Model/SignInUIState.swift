import Foundation

enum SignInUIState: Equatable {
  case none
  case loading
  case goToHomeScreem
  case error(String)
}
