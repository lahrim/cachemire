import SwiftUI
import AVFoundation


struct Button_player: View {
  var text = "Mon titre"
  var favori = false
  var songName = ""
  var useSong = false
  
  @State private var toggleModal = false
    
  @State var audioPlayer:AVAudioPlayer?
  @State private var isPlay = false
  @State private var favoriActive = false
  
  
  func playSound(song: String, format: String = "mp3") {
    let url = Bundle.main.url(forResource: song, withExtension: format)!

    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      guard let player = audioPlayer else { return }
      
      player.prepareToPlay()
      player.play()
      
      isPlay =  true
    } catch let error as NSError {
      print(error.description)
    }
  }
  
  func stopSound() {
    if let player = audioPlayer, player.isPlaying {
      player.stop()
      
      isPlay = false
    }
  }
  
  
  var body: some View {
    HStack{
      Text(text)
        .font(.title2)
        .foregroundStyle(.black)
        .accessibilityLabel(text)
      
      Spacer()
      
      Button("", systemImage: isPlay ? "pause.fill" : "play") {
        isPlay ? stopSound() : playSound(song: songName)
      }
      .padding(.leading, 10)
        .font(.title2)
        .foregroundColor(.black)
      
      if favori {
        Button("", systemImage: favoriActive ? "heart.fill" : "heart"){
          favoriActive.toggle()
          
          if favoriActive {
            toggleModal = true
          }
        }
          .padding(.leading, 10)
          .font(.title2)
          .foregroundColor(favoriActive ? .red : .black)
          .sheet(isPresented: $toggleModal) {
            // début de la modal
            ZStack{
              Color.modal.ignoresSafeArea()
              
              VStack{
                HStack{
                  Spacer()
                  
                  Text("Ajouter aux favoris")
                    .bold()
                  
                  Spacer()
                  
                  Button("", systemImage: "xmark.circle.fill") { toggleModal = false }
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.gray)
                    .font(.title)
                } // HStack
                  .padding(.bottom, 20)
                
                Favorite(modalAddFavorite: true)
                  
                Spacer()
              } // Vstack
                .padding()
            } // ZStack
          } // Modal - sheet
          .accessibilityLabel(favoriActive ? "" : "Ajouter aux favoris")
      }
    }
    .padding(20)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}


//#Preview { Button_player(activeSong: .constant(Bool())) }
