import SwiftUI


struct Dressing: View {
  let arrayList = ["T-shirts", "Pulls", "Jupes", "Pantalons", "Accessoires"]


  var body: some View {
      NavigationView{
        ZStack{
          Color.bg.ignoresSafeArea()

          VStack{
            VStack{
              HStack{
                Text("Dressing")
                  .bold()
                  .font(.system(size: 34))
                
                Spacer()
              } // HStack

              HStack{
                Spacer()
                
                ModalAddCategory()
              } // HStack
            } // VStack
            .padding(.bottom)

            ScrollView{
              ForEach(arrayList, id: \.self) { name in
                NavigationLink(destination: Dressing()) {
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
      } // NavigationView
  }
}


#Preview { Dressing() }
