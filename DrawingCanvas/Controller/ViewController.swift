//
//  ViewController.swift
//  DrawingCanvas
//
//  Created by Lucas Dahl on 1/17/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //====================
    // MARK: - Properties
    //====================
    
    let canvas = Canvas()
    
    
    //================
    // MARK: - Buttons
    //================
    
    let undoButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
        
    }()
    
    let clearBUtton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return button
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        canvas.backgroundColor = UIColor.white
        
        // Setup the stackView
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearBUtton])
        
        // Add the stackview to the subview
        view.addSubview(stackView)
        
        
    }
    
    // Use this to set the frame and add the canvas to the subview
    override func loadView() {
        self.view = canvas
    }


}

