import SwiftUI

struct SignUpView: View {
  
  @State var fullName = ""
  @State var email = ""
  @State var password = ""
  @State var document = ""
  @State var phone = ""
  @State var birthday = ""
  @State var gender = Gender.male
  
  @ObservedObject var viewModel: SignUpViewModel
  
  var body: some View {
    
    ZStack {
      ScrollView(showsIndicators: false) {
        VStack(alignment: .center) {
  
          VStack(alignment: .leading, spacing: 8){
            
            Text("Cadastro")
              .foregroundColor(.black)
              .font(Font.system(.title).bold())
              .padding(.bottom, 8)
            
            fullNameField
            
            emailField
            
            passwordField
            
            documentField
            
            phoneField
            
            birthDayField
            
            genderField
            
            saveButton
          }
          
          Spacer()
        }.padding(.horizontal, 8)
        
      }.padding()
      
      if case SignUpUIState.error(let value) = viewModel.uiState {
        Text("")
          .alert(isPresented: .constant(true)){
            Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
              
            })
          }
      }
    }
  }
}

extension SignUpView {
  var fullNameField: some View {
    TextField("Digite seu e-mail:", text: $fullName)
      .border(Color.black)
  }
}

extension SignUpView {
  var emailField: some View {
    TextField("Digite seu e-mail:", text: $email)
      .border(Color.black)
  }
}

extension SignUpView {
  var passwordField: some View{
    SecureField("Digite sua senha", text: $password)
      .border(Color.orange)
  }
}

extension SignUpView {
  var documentField: some View {
    TextField("CPF", text: $document)
      .border(Color.black)
  }
}

extension SignUpView {
  var phoneField: some View {
    TextField("Telefone:", text: $phone)
      .border(Color.black)
  }
}

extension SignUpView {
  var birthDayField: some View {
    TextField(" ", text: $birthday)
      .border(Color.black)
  }
}

extension SignUpView {
  var genderField: some View {
    Picker("Gender", selection: $gender){
      ForEach(Gender.allCases, id: \.self){
        value in Text(value.rawValue)
          .tag(value)
      }
    }
  }
}

extension SignUpView {
  var saveButton: some View {
    Button("Realize seu cadastro"){
      viewModel.signUp()
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
  
  static var previews: some View {
    SignUpView(viewModel: SignUpViewModel())
  }
}
