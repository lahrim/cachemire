import SwiftUI


struct SuggestionChild: View {
  var vetementName = ""
  
  let arrayList: [ArrayStructGroup] = [
    ArrayStructGroup(name: "Pas de préférence", group: [
      ArrayStruct(name: "T-shirt blanc"),
      ArrayStruct(name: "Pantalon bleu", songName: "song_02"),
      ArrayStruct(name: "Pull rouge")
    ]),
    ArrayStructGroup(name: "Tenue pour le sport", group: [
      ArrayStruct(name: "T-shirt fluo"),
      ArrayStruct(name: "Joggin noir", songName: "song_02"),
      ArrayStruct(name: "Chaussure running"),
      ArrayStruct(name: "Veste coupe vent")
    ]),
    ArrayStructGroup(name: "Tenue pour le travail", group: [
      ArrayStruct(name: "T-shirt blanc"),
      ArrayStruct(name: "Chemise bleu"),
      ArrayStruct(name: "Blazer beige"),
      ArrayStruct(name: "Jean", songName: "song_02")
    ]),
    ArrayStructGroup(name: "Tenue pour un date", group: [
      ArrayStruct(name: "Robe court rouge"),
      ArrayStruct(name: "Talon"),
      ArrayStruct(name: "Veste en jean")
    ]),
    ArrayStructGroup(name: "Tenue pour un concert", group: [
      ArrayStruct(name: "Jean wide leg"),
      ArrayStruct(name: "Croc top"),
      ArrayStruct(name: "Veste en cuir argenté"),
      ArrayStruct(name: "Basquette")
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
