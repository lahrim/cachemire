import SwiftUI
import AVFoundation


struct Button_player: View {
  var text = "Mon titre"
  var favori = false
  var songName = ""
  var useSong = false
    
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
        Button("", systemImage: favoriActive ? "heart.fill" : "heart"){ favoriActive.toggle() }
          .padding(.leading, 10)
          .font(.title2)
          .foregroundColor(favoriActive ? .red : .black)
          .accessibilityLabel(favoriActive ? "" : "Ajouter aux favoris")
      }
    }
    .padding(20)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}


//#Preview { Button_player(activeSong: .constant(Bool())) }
