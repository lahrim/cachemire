import SwiftUI


struct Assistance: View {
  struct Array: Identifiable {
    var id = UUID()
    var name: String
    var song: String = "song_01"
  }
  
  let arrayList: [Array] = [
    Array(name: "Comment ajouter un vêtement ?"),
    Array(name: "Comment créer une combinaison ?", song: "song_02"),
    Array(name: "Comment créer une catégorie ? "),
    Array(name: "Comment scanner un article ?"),
    Array(name: "Comment lire une combinaison ?"),
    Array(name: "Comment mettre en favoris un article ?")
  ]
  
  
  var body: some View {
    NavigationStack{
      ZStack{
        Color.bg.ignoresSafeArea(edges: .top)
        
        ScrollView{
          VStack(alignment: .leading){
            VStack(alignment: .trailing){
              ScrollView{
                ForEach(arrayList) { i in
                  Button_2(text: i.name)
                }
              } // ScrollView

              Spacer()
            } // VStack
          } // VStack
          .padding()
        } // ScrollView
      } // ZStack
      .navigationTitle("Assistance")
    } // NavigationStack
  }
}


#Preview { Assistance() }
