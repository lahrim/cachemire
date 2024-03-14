import SwiftUI


struct ContentView: View {
  @State private var isLoading = true // pour avoir le loading - mettre en true
  @State private var isOpacity = false
    
  
  var body: some View {
    if isLoading {
      LoadingPage()
      .opacity(isOpacity ? 0 : 1)
      .animation(.easeOut(duration: 1), value: isOpacity)
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) { isOpacity = true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.6) { isLoading = false }
      }
    } else {
      TabView {
        Dressing()
          .tabItem { Label("Dressing", systemImage: "tshirt.fill") }
        
        Suggestion()
          .tabItem { Label("Suggestion", systemImage: "lightbulb") }
        
        Favorite()
          .tabItem { Label("Favoris", systemImage: "heart.fill") }
        
        Assistance()
          .tabItem { Label("Assistance", systemImage: "questionmark.circle") }
      }
      .accentColor(.default)
      .onAppear {
        UITabBar.appearance().unselectedItemTintColor = .black
      }
    }
  }
}


#Preview { ContentView() }
