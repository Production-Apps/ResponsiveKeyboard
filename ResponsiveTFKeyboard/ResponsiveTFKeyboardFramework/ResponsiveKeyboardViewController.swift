//
//  ResponsiveKeyboardViewController.swift
//  ResponsiveTFKeyboardFramework
//
//  Created by FGT MAC on 4/11/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit


/// Subclassing ResponsiveKeyboardViewController (which includes UIViewController)  will add the functionality needed in order to automatically  adjust the view layout when the keyboard appears so that the textFields can still be visible while typing.
open class ResponsiveKeyboardViewController: UIViewController {
    
    public var customHeight: Float = 0

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    //Cleanup keyboard events
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
        //Keyboard size
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue) else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            
            let moveBy = keyboardRect.cgRectValue.height - CGFloat(exactly: customHeight)!
            
            view.frame.origin.y = -moveBy
        }else{
            view.frame.origin.y = 0
        }
    }

    

}
