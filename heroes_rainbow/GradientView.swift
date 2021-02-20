import SwiftUI

struct GradientView: View {
    var body: some View {
        AnimatedBackground().edgesIgnoringSafeArea(.all)
    }
}

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors: [Color] = [Color(R.color.purple()!), Color(R.color.turquoise()!), Color(R.color.pink()!), Color(R.color.purple()!), Color(R.color.turquoise()!), Color(R.color.pink()!)]
//    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                .animation(Animation.easeInOut(duration: 2).repeatForever())
                .onReceive(timer, perform: { _ in
                    
                    self.start = UnitPoint(x: 10, y: -10)
                    self.end = UnitPoint(x: 0, y: 5)
                    self.start = UnitPoint(x: -4, y: 2)
                    self.start = UnitPoint(x: 4, y: 0)
                })
                .blur(radius: 50)
            VStack(spacing: 0.0) {
                Rectangle().foregroundColor(.white)
                HStack(spacing: 0.0) {
                    Rectangle().foregroundColor(.white)
                    Image("logo_contour")
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                        .animation(.spring())
                    Rectangle().foregroundColor(.white)

                }
                .frame(height: 200.0)
                Rectangle().foregroundColor(.white)


            }
        }
        
    }
}

struct GradientViewPreview: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
