import SwiftUI


struct ModalAddTitle: View {
  @State private var titleTextField = ""
  
  @Binding var bindingTitleTextField: [String]
  @Binding var toggleModal: Bool
  
  
  var body: some View {
    VStack(alignment: .leading){
      Text("Titre")
        .bold()
        .accessibilityLabel("Titre")
      
      TextField("Titre", text: $titleTextField)
        .padding(20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.bottom, 25)
        .accessibilityLabel("Titre")
      
      Button_action(titleTextField: titleTextField, bindingTitleTextField: $bindingTitleTextField, toggleModal: $toggleModal)
      
      Button_action(annuler: true, bindingTitleTextField: $bindingTitleTextField, toggleModal: $toggleModal)
    }
  }
}
