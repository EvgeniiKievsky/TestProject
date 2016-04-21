//
//  ViewController.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/19/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    @IBAction func Button(sender: AnyObject) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            print("one of field is empty")
        } else {
            loginRequest(emailTextField.text!, password: passwordTextField.text!)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup() {
        createObserversForKeyboard()
    }
    
    func createObserversForKeyboard() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func loginRequest(email: String, password: String) {
        let parameters : [String : AnyObject] = [
            "email" : email,
            "password" : password
        ]
        
        ServerManager.sharedManager.receiveGetDataFor("auth", parameters: parameters,
            success: { (json) -> Void in
                //когда все збс
                let data = json as? Dictionary<String, AnyObject>
                
                User.addPersonToCache(data!)
            }) { (json) -> Void in
                //когда все НЕ ЗБС
        }
    }
    

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        keyboardFrame = self.view.convertRect(keyboardFrame, fromView: nil)
        
        scrollView.contentOffset.y = keyboardFrame.height
    }
    
    func keyboardWillHide(notification:NSNotification){
        scrollView.contentOffset.y = 0
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
   
    
    
}

