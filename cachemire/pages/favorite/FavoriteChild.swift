import SwiftUI


struct FavoriteChild: View {
  var vetementName = ""
  
  @State private var arrayListColor = [""]
  
  let arrayList: [ArrayStruct] = [
    ArrayStruct(name: "T-shirt blanc"),
    ArrayStruct(name: "Pantalon bleu", songName: "song_02"),
    ArrayStruct(name: "Pull rouge")
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
    ZStack{
      Color.bg.ignoresSafeArea(edges: .top)
      
      ScrollView{
        VStack(alignment: .leading){
          VStack(alignment: .trailing){
             ModalAddFavorite()
             .padding(.bottom)
            
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
    .navigationTitle(vetementName)
    .navigationBarTitleDisplayMode(.inline)
    .accessibilityLabel(vetementName)
    .searchable(text: $searchText)
  }
}
