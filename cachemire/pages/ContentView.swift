import SwiftUI


struct ContentView: View {
  @State private var showSettings = false
  @State private var settingsDetent = PresentationDetent.medium


  var body: some View {
    ZStack{
      Color.bg.ignoresSafeArea()

      VStack(alignment: .trailing){
        ModalAddCategory()
          .padding(.bottom)


        Button_1(text: "Bonjour 1")
        Button_1(text: "Bonjour 2")


        Button_2(text: "Bonjour 1")
        Button_2(text: "Bonjour 2", favori: true)

        Spacer()
      } // VStack
      .padding()
    } // ZStack
  }
}


#Preview { ContentView() }
