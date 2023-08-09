import SwiftUI

struct SignInView: View {
  
  @ObservedObject var viewModel: SignInViewModel
  
  @State var email = ""
  @State var password = ""
  
  @State var navigationHidden = true
  
  @State var action: Int? = 0 // variável usada no navigationLink para informar a nova tela
  
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
            .background(Color.white)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(navigationHidden)
            
          
          // para manipular a navigation view vc precisa que o filho dela defina as propriedades que vc quer atribuir.

        }
      }
    }
  }
}

extension SignInView {

  var emailField: some View {
    TextField("Digite seu e-mail:", text: $email)
      .border(Color.black)
  }
}

extension SignInView {
  var passwordField: some View{
    SecureField("Digite sua senha", text: $password)
      .border(Color.orange)
  }
}

extension SignInView {
  var enterButton: some View {
    Button("Entrar"){
      viewModel.login(email: email, password: password)
    }
  }
}

extension SignInView {
  var registerLink: some View {
    VStack{
      Text("Ainda não possui uma conta? Cadastre-se!")
        .foregroundColor(.gray)
        .padding(.top, 48)
      
      ZStack{
        // o navigation link precisa de uma navigationView, que ficará na página p onde o usuário será direcionado.
        //Usar o ZStack para sobrepor a primeira tela
        NavigationLink(
          destination: Text("Tela de cadastro"),
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
