import SwiftUI

struct MainView : View {
    var body: some View {
        VStack {
            Head()
            ScrollView {
                RecentGrid()
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 20)
            Spacer()
        }
        .padding(.vertical, 26)
        .padding(.horizontal, 30)
    }
}


#Preview {
    MainView()
}

