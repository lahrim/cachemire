import SwiftUI


struct DressingChild: View {
  var vetementName = ""
  var modalAddFavorite = false
  
  @State private var arrayListColor = [""]
  @State private var searchText: String = ""
  
  @State var arrayList: [ArrayStruct] = [
    ArrayStruct(name: "blanc"),
    ArrayStruct(name: "bleu", songName: "song_03"),
    ArrayStruct(name: "rouge"),
    ArrayStruct(name: "jaune"),
    ArrayStruct(name: "noir", songName: "song_02")
  ]
  
  var filtered: [ArrayStruct] {
    if searchText.isEmpty {
      return arrayList
    } else {
      return arrayList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
  }
  
  
  var body: some View {
    ZStack{
      if modalAddFavorite {
        Color.modal.ignoresSafeArea()
      } else {
        Color.bg.ignoresSafeArea(edges: .top)
      }
      
      ScrollView{
        VStack(alignment: .leading){
          VStack(alignment: .trailing){
            if !modalAddFavorite {
              ModalAddVetement(bindingTitleTextField: $arrayListColor)
                .padding(.bottom)
            }
            
            ForEach(filtered) { i in
              Button_player(text: vetementName + " " + i.name, favori: true, songName: i.songName)
            }
            
            Spacer()
          } // VStack
        } // VStack
        .padding()
      } // ScrollView
    } // ZStack
    .navigationTitle(vetementName)
    .navigationBarTitleDisplayMode(.inline)
    .accessibilityLabel(vetementName)
    .searchable(text: $searchText)
    .onChange(of: arrayListColor) { _ in
      let validEntries = arrayListColor.filter { !$0.isEmpty }

      for entry in validEntries {
        arrayList.append(ArrayStruct(name: entry))
      }
    }
  }
}
