import SwiftUI


struct Button_1000: View {
  var text = "Mon titre"


  var body: some View {
    Button(
      action: {
      },
      label: {
        Text(text)
          .font(.title2)
          .foregroundStyle(.black)
          .accessibilityLabel(text)

        Spacer()

        Image(systemName: "chevron.right")
          .font(.title2)
          .foregroundColor(.black)
      }
    )
    .padding(20)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}


#Preview { Button_1000() }
