//
//  ViewController.swift
//  DrawingCanvas
//
//  Created by Lucas Dahl on 1/17/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

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
