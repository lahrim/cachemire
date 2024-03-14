import SwiftUI


struct DressingChild: View {
  var vetementName = ""
  
  struct Array: Identifiable {
    var id = UUID()
    var name: String
    var song: String = "song_01"
  }
  
  let arrayList: [Array] = [
    Array(name: "blanc"),
    Array(name: "bleu", song: "song_02"),
    Array(name: "rouge"),
    Array(name: "jaune"),
    Array(name: "noir")
  ]
  
//  @Binding var Nom: String


  var body: some View {
    ZStack{
      Color.bg.ignoresSafeArea(edges: .top)
      
      ScrollView{
        VStack(alignment: .leading){
          VStack(alignment: .trailing){
            // ModalAddCategory(title: "Ajouter un vêtement", bindingTitleTextField: $arrayList)
            // .padding(.bottom)
            
            ScrollView{
              ForEach(arrayList) { i in
                Button_2(text: vetementName + " " + i.name, favori: true)
              }
            } // ScrollView
            
            Spacer()
          } // VStack
        } // VStack
        .padding()
      } // ScrollView
    } // ZStack
    .navigationTitle(vetementName)
    .navigationBarTitleDisplayMode(.inline)
  }
}


#Preview { DressingChild() }
