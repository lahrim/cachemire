import SwiftUI


struct Dressing: View {
  var modalAddFavorite = false
    
  @State private var arrayList = ["T-shirts", "Pulls", "Jupes", "Pantalons"]
  @State private var searchText: String = ""
  
  var filtered: [String] {
    if searchText.isEmpty {
      return arrayList
    } else {
      return arrayList.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
  }


  var body: some View {
    NavigationStack{
      ZStack{
        if modalAddFavorite {
          Color.modal.ignoresSafeArea()
        } else {
          Color.bg.ignoresSafeArea(edges: .top)
        }
        
        ScrollView{
          VStack{
            if !modalAddFavorite {
              VStack{
                HStack{
                  Spacer()
                  
                  ModalAddCategory(bindingTitleTextField: $arrayList)
                } // HStack
              } // VStack
              .padding(.vertical)
            }
            
            ForEach(filtered, id: \.self) { name in
              NavigationLink(destination: DressingChild(vetementName: name, modalAddFavorite: modalAddFavorite)) {
                Text(name.description)
                  .font(.title2)
                  .foregroundStyle(.black)
                  .accessibilityLabel(name.description)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                  .font(.title2)
                  .foregroundColor(.black)
              }
              .padding(20)
              .background(.white)
              .clipShape(RoundedRectangle(cornerRadius: 10))
            } // ForEach
          } // VStack
          .padding()
        } // ScrollView
      } // ZStack
      .navigationTitle("Dressing")
      .navigationBarTitleDisplayMode(modalAddFavorite ? .inline : .large)
      .accessibilityLabel("Dressing")
      .searchable(text: $searchText)
    } // NavigationView
  }
}
