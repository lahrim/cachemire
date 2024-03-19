import SwiftUI
import AVFoundation


struct ModalAddVetement: View {
  @State var audioPlayer:AVAudioPlayer?
  @State private var isPlay = false
  @State private var toggleModal = false
  @State private var settingsDetent = PresentationDetent.medium
  @State private var playInc = 0
  
  @Binding var bindingTitleTextField: [String]
  
  
  func playSound() {
    let url = Bundle.main.url(forResource: "song_03", withExtension: "mp3")!

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
    Button("Ajouter un vêtement") { toggleModal = true }
      .padding(10)
      .padding(.horizontal, 15)
      .font(.system(size: 12))
      .bold()
      .foregroundColor(.white)
      .background(.default)
      .clipShape(RoundedRectangle(cornerRadius: 60))
      .sheet(isPresented: $toggleModal) {
        // début de la modal
        NavigationStack{
          ZStack{
            Color.modal.ignoresSafeArea()
            
            VStack{
              HStack{
                Spacer()
                
                Text("Ajouter un vêtement")
                  .bold()
                
                Spacer()
                
                Button("", systemImage: "xmark.circle.fill") { toggleModal = false }
                  .frame(width: 30, height: 30)
                  .foregroundStyle(.gray)
                  .font(.title)
              } // HStack
              .padding(.bottom, 20)
              
              
              VStack(){
                Button("", systemImage: playInc == 1 ? "stop.circle" : "record.circle"){
                  playInc += 1
                }
                .disabled(playInc > 1 ? true : false)
                .foregroundColor(.red)
                .font(.system(size: 120))
                .opacity(playInc > 1 ? 0.2 : 1)
                
                HStack{
                  Button(
                    action: {
                      isPlay ? stopSound() : playSound()
                    },
                    label: {
                      VStack{
                        Image(systemName: isPlay ? "stop.fill" : "play.fill")
                          .font(.system(size: 100))
                        
                        Text(isPlay ? "Stop" : "Lecture")
                          .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                          .accessibilityLabel(isPlay ? "Stop" : "Lecture")
                      }
                    }
                  )
                  .disabled(playInc > 1 ? false : true)
                  .foregroundColor(.black)
                  .opacity(playInc > 1 ? 1 : 0.2)
                  
                  Spacer()
                  
                  Button(
                    action: {
                      stopSound()
                      playInc = 0
                    },
                    label: {
                      VStack{
                        Image(systemName: "gobackward")
                          .font(.system(size: 78))
                        
                        Text("Réenregistrer")
                          .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                          .accessibilityLabel("Réenregistrer")
                      }
                    }
                  )
                  .disabled(playInc > 1 ? false : true)
                  .foregroundColor(.black)
                  .opacity(playInc > 1 ? 1 : 0.2)
                } // HStack
                .padding(.bottom, 30)
                
                NavigationLink(destination: ModalAddVetementTitle(bindingTitleTextField: $bindingTitleTextField, toggleModal: $toggleModal)) {
                  Text("Valider")
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(minWidth: 100, maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.default)
                    .clipShape(RoundedRectangle(cornerRadius: 60))
                    .accessibilityLabel("Valider")
                    .opacity(playInc > 1 ? 1 : 0.2)
                } // NavigationLink
                  .disabled(playInc > 1 ? false : true)
              } // VStack
              
              Spacer()
            } // Vstack
            .padding()
          } // ZStack
        } // NavigationStack
      } // Modal - sheet
      .accessibilityLabel("Ajouter un vêtement")
  }
}


struct ModalAddVetementTitle: View {
  @State private var titleTextField = ""
  
  @Binding var bindingTitleTextField: [String]
  @Binding var toggleModal: Bool
  
  
  var body: some View {
    ZStack{
      Color.modal.ignoresSafeArea()
      
      VStack{
        ModalAddTitle(bindingTitleTextField: $bindingTitleTextField, toggleModal: $toggleModal)
        
        Spacer()
      } // VStack
      .padding()
    } // ZSTack
    .navigationTitle("Titre du vêtement")
    .navigationBarTitleDisplayMode(.inline)
    .accessibilityLabel("Titre du vêtement")
  }
}
