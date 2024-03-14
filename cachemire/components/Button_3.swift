import SwiftUI


struct Button_3: View {
  var annuler = false
  var titleTextField = ""
  
  @Binding var toggleModal: Bool
  @Binding var bindingTitleTextField: [String]


  var body: some View {
    Button (
      action: {
        if !annuler && (titleTextField.count > 0) {
          bindingTitleTextField.append(titleTextField)
          toggleModal = false
        } else if annuler {
          toggleModal = false
        }
      },
      label: {
        Text(annuler ? "Annuler" : "Valider")
          .bold()
          .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          .frame(minWidth: 100, maxWidth: .infinity)
          .foregroundStyle(.white)
          .padding()
          .background(annuler ? .danger : .default)
          .clipShape(RoundedRectangle(cornerRadius: 60))
      }
    )
    .padding(.bottom, annuler ? 0 : 5)
  }
}


#Preview { Button_3(toggleModal: .constant(Bool()), bindingTitleTextField: .constant([String]())) }
