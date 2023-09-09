import SwiftUI

struct EditTextView: View {
  
  @Binding var text: String
  
  var placeholder: String = ""
  var keyboard: UIKeyboardType = .default
  var error: String? = nil
  var failure: Bool? = nil
  
  var body: some View {
    VStack {
      TextField(placeholder, text: $text)
        .foregroundColor(Color("textField"))
        .keyboardType(keyboard)
        .textFieldStyle(CustomTextFieldStyle())
        
// ########### tratamento de erros
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
                     placeholder: "e-mail",
                     error: "Campo inválido",
                     failure: "a@a".count < 5)
          .padding()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .preferredColorScheme(value)
      
    }
  }
}
