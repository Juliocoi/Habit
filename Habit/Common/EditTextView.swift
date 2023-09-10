import SwiftUI

struct EditTextView: View {
  
  @Binding var text: String
  
  var placeholder: String = ""
  var keyboard: UIKeyboardType = .default
  var error: String? = nil
  var failure: Bool? = nil
  var isSecure: Bool = false
  
  var body: some View {
    VStack {
// Campo de senha
      if isSecure {
        SecureField(placeholder, text: $text)
          .foregroundColor(Color("textField"))
          .keyboardType(keyboard)
          .textFieldStyle(CustomTextFieldStyle())
// campo de e-mail
      } else {
        TextField(placeholder, text: $text)
          .foregroundColor(Color("textField"))
          .keyboardType(keyboard)
          .textFieldStyle(CustomTextFieldStyle())
      }
// ########### erro da validação
      if let error = error, failure == true, !text.isEmpty  {
        Text(error)
          .foregroundColor(.red)
      }
    }
    .padding(.bottom, 10)
  }
}


// ######### Preview
struct EditTextView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(ColorScheme.allCases, id: \.self){ value in
      VStack{
      EditTextView(text: .constant(""),
                     placeholder: "senha",
                     error: "Campo inválido",
                     failure: "a@a.com".count < 3
      )
          .padding()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .preferredColorScheme(value)
      
    }
  }
}
