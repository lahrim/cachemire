import SwiftUI


struct Button_action: View {
  var annuler = false
  var titleTextField = ""
  
  @Binding var bindingTitleTextField: [String]
  @Binding var toggleModal: Bool
  

  var body: some View {
    Button(annuler ? "Annuler" : "Valider") {
      if !annuler && (titleTextField.count > 0) {
        bindingTitleTextField.append(titleTextField)
        toggleModal = false
      } else if annuler {
        toggleModal = false
      }
    }
    .disabled((!annuler && titleTextField.count == 0) == true)
    .bold()
    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    .frame(minWidth: 100, maxWidth: .infinity)
    .foregroundStyle(.white)
    .padding()
    .background(annuler ? .danger : .default)
    .clipShape(RoundedRectangle(cornerRadius: 60))
    .opacity(annuler ? 1 : (titleTextField.count > 0 ? 1: 0.5))
    .padding(.bottom, annuler ? 0 : 5)
    .accessibilityLabel(annuler ? "Annuler" : "Valider")
  }
}
