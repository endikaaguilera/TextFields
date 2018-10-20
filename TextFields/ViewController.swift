//
//  ViewController.swift
//  TextFieldChallengeApps
//
//  Created by Endika Aguilera on 19/10/18.
//  Copyright © 2018 Endika Aguilera. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    let emojisDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
    
    // MARK: Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField1.delegate = self.zipCodeDelegate
        self.textField2.delegate = self.cashDelegate
        self.textField3.delegate = self
        self.textField4.delegate = emojisDelegate
        self.textField5.delegate = colorizerDelegate
        self.textField6.delegate = randomColorDelegate
        
        self.editingSwitch.setOn(false, animated: false)
        
        initKeyboarHandler()
    }
    
    // MARK: Text Field Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    // MARK: Actions
    
    @IBAction func toggleTheTextEditor(_ sender: AnyObject) {
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
    
    func initKeyboarHandler() {
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboarHandler), name:
            UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
            #selector(keyboarHandler), name:
            UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboarHandler(notification: Notification) {
        
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame =
            (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue)
                .cgRectValue
        let keyboardViewEndFrame =
            view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            self.scrollView?.contentInset = UIEdgeInsets.zero
        } else {
            let height = keyboardViewEndFrame.height
            self.scrollView?.contentInset =
                UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
        }
        
        self.scrollView?.scrollIndicatorInsets = self.scrollView.contentInset
    }

}
