import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            SplashGradient()
            SplashText()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

#Preview {
    SplashView()
}

