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
    
    
    //====================
    // MARK: - UI elements
    //====================
    
    let undoButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
        
    }()
    
    let clearBUtton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
        
    }()
    
    let yellowButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        // Makes a black border around the button
        button.layer.borderWidth = 1
        return button
        
    }()
    
    let redButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        // Makes a black border around the button
        button.layer.borderWidth = 1
        return button
        
    }()
    
    let blueButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        // Makes a black border around the button
        button.layer.borderWidth = 1
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        canvas.backgroundColor = UIColor.white
        
        setupLayout()
        
    }
    
    let slider: UISlider = {
       
        let slider = UISlider()
        // Set the min and max for the slider
        slider.minimumValue = 1
        slider.maximumValue = 10
        return slider
        
    }()
    
    // Use this to set the frame and add the canvas to the subview
    override func loadView() {
        self.view = canvas
    }
    
    fileprivate func setupLayout() {
        
        // Color stackview
        let colorStackView = UIStackView(arrangedSubviews: [yellowButton, blueButton, redButton])
        colorStackView.distribution = .fillEqually
        
        // Setup the stackView
        let stackView = UIStackView(arrangedSubviews: [undoButton, colorStackView, clearBUtton, slider])
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        // This is needed to allow auto-layout constraints through code usable
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stackview to the subview
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
    }
    
    //================
    // MARK: - Actions
    //================
    
    @objc fileprivate func handleUndo() {
        
        // Call the undo method from the canvas class
        canvas.undo()
        
    }
    
    @objc fileprivate func handleClear() {
        
        // Call the clear method from the canvas class
        canvas.clear()
        
    }


}

