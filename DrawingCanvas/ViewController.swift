//
//  ViewController.swift
//  DrawingCanvas
//
//  Created by Lucas Dahl on 1/17/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    // Properties
    var line = [CGPoint]()
    
    override func draw(_ rect: CGRect) {
        
        // Custom drawing
        super.draw(rect)
        
        // Get a hold of the context
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Setup the lines
        
        // Test dummy data
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        // Iterate through the array
        for (i, p) in line.enumerated() {
            
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
    
    // Track the users finger - Captures where the finger moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Get the first point touched
        guard let point = touches.first?.location(in: nil) else { return }
        //print(point)
        
        // Apend the array woth the touched points
        line.append(point)
        
        // Redraw the line
        setNeedsDisplay()
        
    }
    
}

class ViewController: UIViewController {
    
    // Properties
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add canvas to the subview
        view.addSubview(canvas)
        
        // Set the background color
        canvas.backgroundColor = UIColor.white
        
        // Set the frame
        canvas.frame = view.frame
        
    }


}

