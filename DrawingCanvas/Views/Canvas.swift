//
//  Canvas.swift
//  DrawingCanvas
//
//  Created by Lucas Dahl on 1/18/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

// CG stands for core graphics
import UIKit

class Canvas: UIView {
    
    // Properties
    fileprivate var lines = [Line]()
    fileprivate var strokeColor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    override func draw(_ rect: CGRect) {
        // Custom drawing
        super.draw(rect)
        
        // Get a hold of the context
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        lines.forEach { (line) in
            
            // Iterate through the array
            for (i, p) in line.points.enumerated() {
                
                // Set the color
                context.setStrokeColor(line.color.cgColor)
                // Set the line width
                context.setLineWidth(CGFloat(line.strokeWidith))
                // Set the line cap(rounded end in this case)
                context.setLineCap(.round)
                
                if i == 0 {
                    
                    // Begin the line
                    context.move(to: p)
                    
                } else {
                    
                    // Continue the line
                    context.addLine(to: p)
                    
                }
                
            }
            
            // Helps paint a line on the canvas
            context.strokePath()
            
        }
    }
    
    //=================
    // MARK : - Touches
    //=================
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Add a new line for every touch
        lines.append(Line.init(color: strokeColor, strokeWidith: strokeWidth, points: []))
        
    }
    
    // Track the users finger - Captures where the finger moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Get the first point touched
        guard let point = touches.first?.location(in: nil) else { return }
        //print(point) // = Test
        // Get last line
        guard var lastLine = lines.popLast() else { return }
        
        // Apend the array with the touched points
        lastLine.points.append(point)
        // Makes sure the last line is poperly added
        lines.append(lastLine)
        
        // Redraws the canavs with all the lines
        setNeedsDisplay()
        
    }
    
    //=========================
    // MARK: - Public functions
    //=========================
    func undo() {
        
        // Removes the last appened line
        _ = lines.popLast()
        
        // Call the draw function again
        setNeedsDisplay()
        
    }
    
    func clear() {
        
        // Removes all the lines in the array
        lines.removeAll()
        
        // Call the draw function again
        setNeedsDisplay()
        
    }
    
    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }
    
    func setSrokeWidth(width: Float) {
        self.strokeWidth = width
    }
    
}
