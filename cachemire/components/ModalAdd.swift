import SwiftUI


struct ModalAdd: View {
  var title = "Ajouter une catégorie"

  @State private var toggleModal = false
  @State private var settingsDetent = PresentationDetent.medium
  @State private var titleTextField = ""


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


              Button ("Valider") { /* mon code */ }
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 100, maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding()
                .background(.default)
                .clipShape(RoundedRectangle(cornerRadius: 60))
                .padding(.top, 25)
                .padding(.bottom, 5)
              
              Button ("Annuler") { toggleModal = false }
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 100, maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding()
                .background(.danger)
                .clipShape(RoundedRectangle(cornerRadius: 60))
            }

            Spacer()
          } // Vstack
          .padding()
        } // ZStack
      } // Modal - sheet
  }
}


#Preview { ModalAdd() }
