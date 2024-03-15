import SwiftUI
import AVFoundation


struct Songs: View {
  @State var audioPlayer:AVAudioPlayer?
  @State private var isPlaying = false
  
  
  func playSound() {
    @State var url = Bundle.main.url(forResource: "song_01", withExtension: "mp3")!
    
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      guard let player = audioPlayer else { return }

      player.prepareToPlay()
      player.play()

    } catch let error as NSError {
      print(error.description)
    }
  }
  
  
  var body: some View {
    Button("", systemImage: isPlaying ? "pause.fill" : "play") {
//      AVPlayer.sharedDingPlayer.play()
    }
    .padding(.leading, 10)
      .font(.title2)
      .foregroundColor(.black)
  }
}


#Preview { Songs() }
