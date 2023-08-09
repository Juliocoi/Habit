import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    Text("Hello, Home Page!")
  }
}

struct HomeView_Preview: PreviewProvider{
  static var previews: some View{
    let viewModel = HomeViewModel()
    HomeView(viewModel: viewModel)
  }
}
