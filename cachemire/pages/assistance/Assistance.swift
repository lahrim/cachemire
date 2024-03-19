import SwiftUI


struct Assistance: View {
  let arrayList: [ArrayStruct] = [
    ArrayStruct(name: "Comment ajouter un vêtement ?"),
    ArrayStruct(name: "Comment créer une combinaison ?", songName: "song_02"),
    ArrayStruct(name: "Comment créer une catégorie ? "),
    ArrayStruct(name: "Comment scanner un article ?"),
    ArrayStruct(name: "Comment lire une combinaison ?"),
    ArrayStruct(name: "Comment mettre en favoris un article ?")
  ]
  
  @State private var searchText: String = ""
  
  var filtered: [ArrayStruct] {
    if searchText.isEmpty {
      return arrayList
    } else {
      return arrayList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
  }
  
  
  var body: some View {
    NavigationStack{
      ZStack{
        Color.bg.ignoresSafeArea(edges: .top)
        
        ScrollView{
          VStack(alignment: .leading){
            VStack(alignment: .trailing){
              ScrollView{
                ForEach(filtered) { i in
                  Button_player(text: i.name)
                }
              } // ScrollView

              Spacer()
            } // VStack
          } // VStack
          .padding()
        } // ScrollView
      } // ZStack
      .navigationTitle("Assistance")
      .accessibilityLabel("Assistance")
      .searchable(text: $searchText)
    } // NavigationStack
  }
}
