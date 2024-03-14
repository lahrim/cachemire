import SwiftUI
import AVFoundation


extension AVPlayer {
  static let sharedDingPlayer: AVPlayer = {
    var nameSong = "song_01"
    var format = "mp3"
    
    guard let url = Bundle.main.url(forResource: nameSong, withExtension: format) else { fatalError("Failed to find sound file.") }

    return AVPlayer(url: url)
  }()
}


struct Button_2: View {
  var text = "Mon titre"
  var favori = false
  
  @State private var isPlaying = false
  @State private var favoriActive = false
  @State var audioPlayer:AVAudioPlayer?
  
  func togglePlaying() {
//    AVPlayer.sharedDingPlayer.play()
//    audioPlayer?.play()
    if let player = audioPlayer {
      player.play()
      
      if isPlaying {
        player.pause()
      }
      
      // todo - savoir changer tout les icones en play quand l'ont enclanche un autre son
      
      isPlaying.toggle()
    }
  }
  
  
  var body: some View {
    HStack{
      Text(text)
        .font(.title2)
        .foregroundStyle(.black)
      
      Spacer()
      
      Button("", systemImage: isPlaying ? "pause.fill" : "play") {
        togglePlaying()
//        AVPlayer(url: "song_1")
//        audioPlayer?.play()
      }
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
