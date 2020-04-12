//
//  ViewController.swift
//  ResponsiveTFKeyboard
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit
import ResponsiveTFKeyboardFramework

class ViewController: ResponsiveKeyboardViewController {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldOutlet.delegate = self
        
        self.customHeight = 0
        self.clearTextFieldWhenReturnKeyPressed = true
    }

    @IBAction func textField(_ sender: UITextField) {
       label.text =  sender.text
    }
    
    
    
}

