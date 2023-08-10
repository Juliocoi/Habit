import Foundation

enum Gender: String, CaseIterable, Identifiable{
  case male = "Masculino"
  case female = "Feminino"
  case outro = "Outro"
  case prefiroNaoInformar = "Prefiro não informar"
  
  var id: String {
    self.rawValue
  }
}
