import SwiftUI


struct Suggestion: View {
  struct Array: Identifiable {
    var id = UUID()
    var name: String
    @State public var active: Bool = false
  }
  
  var arrayList: [Array] = [
    Array(name: "Pas de préférence"),
    Array(name: "Couleur bleu"),
    Array(name: "Couleur rouge"),
    Array(name: "Couleur jaune"),
    Array(name: "Couleur noir")
  ]

  
  var body: some View {
    NavigationStack{
      ZStack{
        Color.bg.ignoresSafeArea(edges: .top)
        
        List {
          Section(header: Text("Mes préférences").bold().font(.title3).foregroundStyle(.black).padding(.bottom, 5)) {
            ForEach(arrayList) { w in
              HStack {
                Button(w.name, systemImage: w.active ? "smallcircle.filled.circle" : "circle") {
                  let idActive = w.id
                  
                  for i in arrayList.indices {
                    arrayList[i].active = (arrayList[i].id == idActive)
                  }
                }
                .foregroundColor(.black)
              } // HStack
            } // ForEach
          } // Section
        } // List
        .scrollContentBackground(.hidden)
      } // ZStack
      .navigationTitle("Suggestion")
    } // NavigationStack
  }
}


#Preview { Suggestion() }
