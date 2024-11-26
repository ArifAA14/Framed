import Cocoa
import SwiftUI

protocol SelectionToolDelegate: AnyObject {
    func didSelect(rect: CGRect) async
}

class SelectionTool: NSView {
    weak var delegate: SelectionToolDelegate?
    private var startPoint: NSPoint = .zero
    private var endPoint: NSPoint = .zero
    private var selectionLayer: CAShapeLayer = CAShapeLayer()
    private var progressHostingView: NSHostingView<ProgressBarView>? 
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        
        self.layer?.addSublayer(selectionLayer)
        selectionLayer.fillColor = NSColor.clear.cgColor
        selectionLayer.strokeColor = NSColor.white.cgColor
        selectionLayer.lineDashPattern = [5, 3] // Dashed line
        selectionLayer.lineWidth = 1.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
        startPoint = event.locationInWindow
        endPoint = startPoint
        updateSelection()
        removeProgressView()
    }
    
    override func mouseDragged(with event: NSEvent) {
        endPoint = event.locationInWindow
        updateSelection()
    }
    
    override func mouseUp(with event: NSEvent) {
        endPoint = event.locationInWindow
        updateSelection()
        let rect = selectionRect()
        Task {
            await delegate?.didSelect(rect: rect)
        }
        print("Selected Rectangle: \(selectionRect())")
        showProgressView(in: rect, duration: 5)
    }
    
    private func updateSelection() {
        let rect = selectionRect()
        let path = CGMutablePath()
        path.addRect(rect)
        selectionLayer.path = path
    }
    
    private func selectionRect() -> CGRect {
        CGRect(
            x: min(startPoint.x, endPoint.x),
            y: min(startPoint.y, endPoint.y),
            width: abs(endPoint.x - startPoint.x),
            height: abs(endPoint.y - startPoint.y)
        )
    }
    
    private func showProgressView(in rect: CGRect, duration: TimeInterval) {
        let progressView = ProgressBarView(duration: duration)
        let hostingView = NSHostingView(rootView: progressView)
        hostingView.frame = CGRect(
            x: rect.minX,
            y: rect.minY - 60,
            width: rect.width,
            height: 20
        )
        self.addSubview(hostingView)
        self.progressHostingView = hostingView
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.removeProgressView()
        }
    }
    
    private func removeProgressView() {
        progressHostingView?.removeFromSuperview()
        progressHostingView = nil
    }
}

