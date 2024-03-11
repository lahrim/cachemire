import SwiftUI


struct Button_3: View {
  var annuler = false
  @Binding var toggleModal: Bool


  var body: some View {
    Button (
      action: {
        if annuler { toggleModal = false }
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


#Preview { Button_3(toggleModal: .constant(false)) }
