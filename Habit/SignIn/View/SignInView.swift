import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel
  
  @State var email = ""
  @State var password = ""
  
  @State var navigationHidden = true
  
  @State var action: Int? = 0
  
  var body: some View {
    
    ZStack {
      
      if case SignInUIState.goToHomeScreem = viewModel.uiState {
        viewModel.homeView()
      } else {
        NavigationView {
          
          ScrollView (showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 50) {
              
              Spacer(minLength: 36)
              
              VStack (alignment: .center, spacing: 8){
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .padding(.horizontal, 48)
                
                Text("Login")
                  .foregroundColor(.orange)
                  .font(Font.system(.title).bold())
                  .padding(.bottom, 8)
                
                emailField
                
                passwordField
                
                enterButton
                
                registerLink
                
                Text("Copyright @yyy")
                  .foregroundColor(Color.gray)
                  .font(Font.system(size: 16).bold())
                  .padding(.top, 8)
              }
            }
            
            if case SignInUIState.error(let value) = viewModel.uiState {
              Text("")
                .alert(isPresented: .constant(true)){
                  Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("ok")){
                    viewModel.uiState = .none
                  })
                }
            }
          }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(navigationHidden)
        }
      }
    }
  }
}

extension SignInView {
  var emailField: some View {
    EditTextView(text: $email,
                 placeholder: "e-mail",
                 keyboard: .emailAddress,
                 error: "E-mail válido",
                 failure: !email.isEmail())
  }
}

extension SignInView {
  var passwordField: some View{
    EditTextView(text: $password,
                 placeholder: "senha",
                 keyboard: .emailAddress,
                 error: "A senha deve ter ao menos 8 characteres",
                 failure: password.count < 8,
                 isSecure: true
    )
  }
}

extension SignInView {
  var enterButton: some View {
    LoadingButtonView(action: {
      viewModel.login(email: email, password: password)
    },
                      text: "Entrar",
                      showProgress: self.viewModel.uiState == SignInUIState.loading,
                      disabled: !email.isEmail() || password.count < 8)
  }
}

extension SignInView {
  var registerLink: some View {
    VStack{
      Text("Ainda não possui uma conta? Cadastre-se!")
        .foregroundColor(.gray)
        .padding(.top, 48)
      
      //Usar o ZStack para sobrepor a primeira tela
      ZStack{
        // o navigation link precisa de uma navigationView, que ficará na página p onde o usuário será direcionado.
        NavigationLink(
          destination: viewModel.signUpView(),
          tag: 1,
          selection: $action,
          label: { EmptyView() })
        
        Button("Realize seu cadastro"){
          self.action = 1
        }
      }
    }
  }
}

struct SignInView_Preview: PreviewProvider {
  static var previews: some View {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
  }
}
