import SwiftUI


struct ModalAddCategory: View {
  var title = "Ajouter une catégorie"
  @State private var toggleModal = false
  @State private var titleTextField = ""
  
  @Binding var bindingTitleTextField: [String]
  
  
  var body: some View {
    Button(title) { toggleModal = true }
      .padding(10)
      .padding(.horizontal, 15)
      .font(.system(size: 12))
      .bold()
      .foregroundColor(.white)
      .background(.default)
      .clipShape(RoundedRectangle(cornerRadius: 60))
      .sheet(isPresented: $toggleModal) {
        // début de la modal
        ZStack{
          Color.modal.ignoresSafeArea()
          
          VStack{
            HStack{
              Spacer()
              
              Text(title)
                .bold()
              
              Spacer()
              
              Button("", systemImage: "xmark.circle.fill") { toggleModal = false }
                .frame(width: 30, height: 30)
                .foregroundStyle(.gray)
                .font(.title)
            } // HStack
              .padding(.bottom, 20)
            
            ModalAddTitle(bindingTitleTextField: $bindingTitleTextField, toggleModal: $toggleModal)
              
            Spacer()
          } // Vstack
            .padding()
        } // ZStack
      } // Modal - sheet
      .accessibilityLabel(title)
  }
}
