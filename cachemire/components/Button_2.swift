import SwiftUI


struct Button_2: View {
  var text = "Mon titre"
  var favori = false
  
  @State private var reading = false
  @State private var favoriActive = false
  
  
  var body: some View {
    HStack{
      Text(text)
        .font(.title2)
        .foregroundStyle(.black)

      Spacer()
      
      Button("", systemImage: reading ? "pause.fill" : "play"){ reading.toggle() }
        .font(.title2)
        .foregroundColor(.black)
      
      if favori {
        Button("", systemImage: favoriActive ? "heart.fill" : "heart"){ favoriActive.toggle() }
          .font(.title2)
          .foregroundColor(favoriActive ? .red : .black)
      }
    }
    .padding(20)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}


#Preview { Button_2() }
