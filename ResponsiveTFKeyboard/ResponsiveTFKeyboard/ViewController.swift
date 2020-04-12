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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.customHeight = 100
    }

    @IBAction func textField(_ sender: UITextField) {
        print(sender.text!)
       label.text =  sender.text!
    }
    
    
    
}

