import SwiftUI


struct DressingChild: View {
  var vetementName = ""
  
  struct Array: Identifiable {
    var id = UUID()
    var name: String
    var songName: String = "song_01"
    var useSong: Bool = false
  }
  
  @State var arrayList: [Array] = [
    Array(name: "blanc"),
    Array(name: "bleu", songName: "song_03"),
    Array(name: "rouge"),
    Array(name: "jaune"),
    Array(name: "noir", songName: "song_02")
  ]
  
  @State private var lhm: Bool = false


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
                Button_2(text: vetementName + " " + i.name, favori: true, songName: i.songName, activeSong: $lhm )
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
    .accessibilityLabel(vetementName)
    
    
  }
}


#Preview { DressingChild() }
