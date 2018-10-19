//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Endika Aguilera on 19/10/18.
//  Copyright © 2018 Endika Aguilera. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // @TODO: Set the color of your text here!
        textField.textColor = self.randomColor()
        return true
    }    
    
}
