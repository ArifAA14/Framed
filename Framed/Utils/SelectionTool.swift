//
//  SelectionTool.swift
//  MyFirst
//
//  Created by Ali on 21/11/2024.
//

import Cocoa
import QuartzCore


protocol SelectionToolDelegate: AnyObject {
    func didSelect(rect: CGRect) async
}

class SelectionTool: NSView {
    weak var delegate: SelectionToolDelegate?
    private var startPoint: NSPoint = .zero
    private var endPoint: NSPoint = .zero
    private var selectionLayer: CAShapeLayer = CAShapeLayer()
    
    
    override init (frame frameRect: NSRect) {
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
    
    // Track where the mouse click starts
    override func mouseDown(with event: NSEvent) {
        startPoint = event.locationInWindow
        endPoint = startPoint // Initialize endPoint to startPoint
        updateSelection() // Initialize the selection rectangle
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
}
