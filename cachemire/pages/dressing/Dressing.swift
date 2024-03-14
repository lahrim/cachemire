import SwiftUI


struct Dressing: View {
  @State private var arrayList = ["T-shirts", "Pulls", "Jupes", "Pantalons"]


  var body: some View {
    NavigationStack{
      ZStack{
        Color.bg.ignoresSafeArea(.all)
        
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
          } // VStack
          .padding()
        } // ScrollView
      } // ZStack
      .navigationTitle("Dressing")
    } // NavigationView
  }
}


#Preview { Dressing() }
