import SwiftUI


struct category: View {
  @State private var arrayList = ["Anniversaires", "Lundi", "Soirée cinéma"]
  
  
  var body: some View {
    NavigationStack{
      ZStack{
        Color.bg.ignoresSafeArea(edges: .top)
        
        VStack{
          VStack{
            HStack{
              Spacer()
              
              ModalAddCategory(bindingTitleTextField: $arrayList)
            } // HStack
          } // VStack
          .padding(.vertical)
          
          
          ScrollView{
            ForEach(arrayList, id: \.self) { name in
              NavigationLink(destination: DressingChild(vetementName: name)) {
                Text(name.description)
                  .font(.title2)
                  .foregroundStyle(.black)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                  .font(.title2)
                  .foregroundColor(.black)
              }
              .padding(20)
              .background(.white)
              .clipShape(RoundedRectangle(cornerRadius: 10))
            } // ForEach
          } // ScrollView
        } // VStack
        .padding(.horizontal)
      } // ZStack
      .navigationTitle("Favoris")
    } // NavigationView
  }
}


#Preview { category() }
