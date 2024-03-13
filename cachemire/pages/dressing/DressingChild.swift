import SwiftUI


struct DressingChild: View {
  let arrayList: [String] = ["T-shirts blanc", "T-shirts bleu", "T-shirts rouge", "T-shirts jaune", "T-shirts noir"]


  var body: some View {
    ZStack{
      Color.bg.ignoresSafeArea()
      
      VStack(alignment: .leading){
        ZStack(alignment: .leading){
          NavigationView {
            List {
              NavigationLink(destination: Dressing()) {
                Text("Retour")
              }
            }
            .navigationBarTitle(Text("Dressing"))
          }
//          Button("Retour", systemImage: "chevron.left"){}


          HStack{
            Spacer()
            Text("Dressing")
              .bold()
              .font(.system(.title2))
            Spacer()
          } // HStack
        } // ZStack
        .padding(.bottom)

        VStack(alignment: .trailing){
          ModalAddCategory(title: "Ajouter un vêtement")
            .padding(.bottom)

          ScrollView{
            ForEach(arrayList, id: \.self) { name in
              Button_2(text: name.description, favori: true)
            }
          } // ScrollView

          Spacer()
        } // VStack
      } // VStack
      .padding()
    } // ZStack
  }
}


#Preview { DressingChild() }
