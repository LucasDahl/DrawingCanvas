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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        canvas.backgroundColor = UIColor.white
        
        setupLayout()
        
    }
    
    // Use this to set the frame and add the canvas to the subview
    override func loadView() {
        self.view = canvas
    }
    
    fileprivate func setupLayout() {
        
        // Setup the stackView
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearBUtton])
        stackView.distribution = .fillEqually
        
        // This is needed to allow auto-layout constraints through code usable
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stackview to the subview
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    //================
    // MARK: - Actions
    //================
    
    @objc fileprivate func handleUndo() {
        print("undo")
    }
    
    @objc fileprivate func handleClear() {
        print("Clear")
    }


}

