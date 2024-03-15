import SwiftUI


struct Favorite: View {
  @State private var arrayList = ["Anniversaires", "Lundi", "Soirée cinéma"]
  
  
  var body: some View {
    NavigationStack{
      ZStack{
        Color.bg.ignoresSafeArea(edges: .top)
        
        ScrollView{
          VStack{
            VStack{
              HStack{
                Spacer()
                
                ModalAddCategory(bindingTitleTextField: $arrayList)
              } // HStack
            } // VStack
            .padding(.vertical)
            
            
            
            ForEach(arrayList, id: \.self) { name in
              NavigationLink(destination: FavoriteChild(vetementName: name)) {
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
      .navigationTitle("Favoris")
      .accessibilityLabel("Favoris")
    } // NavigationView
  }
}


#Preview { Favorite() }
