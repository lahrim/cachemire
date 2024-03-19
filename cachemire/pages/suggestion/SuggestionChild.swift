import SwiftUI


struct SuggestionChild: View {
  var vetementName = ""
  
  let arrayList: [ArrayStructGroup] = [
    ArrayStructGroup(name: "Pas de préférence", group: [
      ArrayStruct(name: "T-shirt blanc"),
      ArrayStruct(name: "Pantalon bleu", songName: "song_02"),
      ArrayStruct(name: "Pull rouge")
    ]),
    ArrayStructGroup(name: "Couleur bleu", group: [
      ArrayStruct(name: "T-shirt bleu"),
      ArrayStruct(name: "Jean", songName: "song_02")
    ]),
    ArrayStructGroup(name: "Couleur rouge", group: [
      ArrayStruct(name: "T-shirt blanc"),
      ArrayStruct(name: "Pantalon noir", songName: "song_02"),
      ArrayStruct(name: "Pull rouge")
    ]),
    ArrayStructGroup(name: "Couleur jaune", group: [
      ArrayStruct(name: "T-shirt jaune"),
      ArrayStruct(name: "Jean", songName: "song_02"),
    ]),
    ArrayStructGroup(name: "Couleur noir", group: [
      ArrayStruct(name: "T-shirt noir"),
      ArrayStruct(name: "Pantalon noir", songName: "song_02"),
      ArrayStruct(name: "Pull noir")
    ])
  ]

  
  var body: some View {
    ZStack{
      Color.bg.ignoresSafeArea(edges: .top)
      
      ScrollView{
        VStack(alignment: .leading){
          VStack(alignment: .trailing){
            ScrollView{
              ForEach(arrayList) { i in
                if i.name == vetementName {
                  ForEach(i.group){a in
                    Button_player(text: a.name)
                  }
                }
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
