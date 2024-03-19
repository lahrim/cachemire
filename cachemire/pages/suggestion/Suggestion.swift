import SwiftUI


struct Suggestion: View {
  @State private var arrayList: [ArrayStruct] = [
    ArrayStruct(name: "Pas de préférence"),
    ArrayStruct(name: "Tenue pour le sport"),
    ArrayStruct(name: "Tenue pour le travail"),
    ArrayStruct(name: "Tenue pour un date"),
    ArrayStruct(name: "Tenue pour un concert")
  ]
  
  @State private var reponse = ""

  
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
                    
                    if arrayList[i].active {
                      reponse = arrayList[i].name
                    }
                  }
                }
                .foregroundColor(.black)
                .accessibilityLabel(w.name)
              } // HStack
            } // ForEach
          } // Section
          .accessibilityLabel("Mes préférences")
        } // List
        .scrollContentBackground(.hidden)
        
        VStack{
          NavigationLink(destination: SuggestionChild(vetementName: reponse)) {
            Text("Valider")
              .bold()
              .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
              .frame(minWidth: 100, maxWidth: .infinity)
              .foregroundStyle(.white)
              .padding()
              .background(.default)
              .clipShape(RoundedRectangle(cornerRadius: 60))
              .accessibilityLabel("Valider")
          } // NavigationLink
          .disabled(reponse.isEmpty)
        } // VStack
          .opacity(reponse.isEmpty ? 0.5 : 1)
          .animation(.easeOut(duration: 0.5), value: !reponse.isEmpty)
          .padding()
          .padding(.top, 30)
      } // ZStack
      .navigationTitle("Suggestion")
      .accessibilityLabel("Suggestion")
    } // NavigationStack
  }
}
