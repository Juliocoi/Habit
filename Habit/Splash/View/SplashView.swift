import SwiftUI

struct SplashView: View {
  
  @ObservedObject var viewModel: SplashViewModel
  
  var body: some View {
    Group {
      switch viewModel.uiState {
      case .loading:
        loadingView()
        
      case .goToSignInScreen:
        viewModel.signInView()
        
      case .goToHomeScreen:
        Text("Tela Home")
      case .error(let msg):
        loadingView(error: msg)
      }
    }.onAppear(perform: {
      viewModel.onAppear()
    })
  }
}

extension SplashView {
  func loadingView(error: String? = nil) -> some View {
    ZStack {
      Image("logo")
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .padding(10)
        .ignoresSafeArea()
      
      if let error = error {
        Text("")
          .alert(isPresented: .constant(true)){
            Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("ok")){
              
            })
          }
      }
    }
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = SplashViewModel()
    SplashView(viewModel: viewModel)
  }
}
