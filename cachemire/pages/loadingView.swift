import SwiftUI


struct LoadingView: View {
  @State private var isVisible = false
  
  
  var body: some View {
    VStack {
      Text("CACHEMIRE")
        .foregroundColor(.white)
        .font(.system(size: 55))
        .bold()
        .opacity(isVisible ? 1 : 0)
        .offset(y: isVisible ? 0 : -30)
    } // VStack
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.default)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        withAnimation(.easeInOut(duration: 1.5)) {
          isVisible = true
        } // withAnimation
      } // DispatchQueue
    } // onAppear
  }
}


#Preview { LoadingView() }
