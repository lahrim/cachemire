import SwiftUI


struct ArrayStruct: Identifiable {
  var id = UUID()
  var name: String
  var songName: String = "song_01"
  var useSong: Bool = false
  var active: Bool = false
}

struct ArrayStructGroup: Identifiable {
  let id = UUID()
  let name: String
  let group: [ArrayStruct]
}
