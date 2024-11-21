import SwiftUI

struct RecentGrid: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(
                columns: [
                    .init(.adaptive(minimum: 150)),
                    .init(.adaptive(minimum: 150)),
                    .init(.adaptive(minimum: 150)),
                    .init(.adaptive(minimum: 150)),
                ],
                spacing: 20 // Add spacing between rows
            ) {
                
                ForEach(0..<8) { _ in
                    VStack {
                        Color.white.opacity(0.06)
                            .blendMode(.luminosity)
                            .frame(maxWidth: .infinity, minHeight: 100)
                            .frame(height: 150)
                            .cornerRadius(6)
                            .shadow(radius: 10)
                        Text("Title")
                            .padding(.top, 4)
                            .padding(.horizontal, 10)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Lorem Ipsum..")
                            .padding(.top, 0.002)
                            .padding(.horizontal, 10)
                            .fontWeight(.light)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .scrollIndicators(.never)
        .onAppear {
            hideScrollBar()
        }
    }
    
    private func hideScrollBar() {
        DispatchQueue.main.async {
            for view in NSApp.windows.first?.contentView?.subviews ?? [] {
                if let scrollView = view as? NSScrollView {
                    scrollView.hasVerticalScroller = false
                    scrollView.hasHorizontalScroller = false
                }
            }
        }
    }
}