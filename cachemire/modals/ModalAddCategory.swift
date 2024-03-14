import SwiftUI


struct ModalAddCategory: View {
  var title = "Ajouter une catégorie"
  
  @State private var toggleModal = false
  @State private var settingsDetent = PresentationDetent.medium
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
            
            
            VStack(alignment: .leading){
              Text("Titre")
                .bold()
              
              TextField("Titre", text: $titleTextField)
                .padding(20)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom, 25)
              
              Button_3(titleTextField: titleTextField, toggleModal: $toggleModal, bindingTitleTextField: $bindingTitleTextField)
              
              Button_3(annuler: true, toggleModal: $toggleModal, bindingTitleTextField: $bindingTitleTextField)
            } // VStack
              
            Spacer()
          } // Vstack
            .padding()
        } // ZStack
      } // Modal - sheet
  }
}


#Preview { ModalAddCategory(bindingTitleTextField: .constant([String]())) }
