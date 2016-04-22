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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    @IBAction func Button(sender: AnyObject) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "One of field is empty", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Return", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            self.activityIndicatorView.startAnimating()
            loginRequest(emailTextField.text!, password: passwordTextField.text!)
            
        }
    }
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
        loginButtonOptions()
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
                self.performSegueWithIdentifier("switchSeague", sender: self)
                let data = json as? Dictionary<String, AnyObject>
                User.addPersonToCache(data!)
                let token = data!["token"] as! String
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setValue(token, forKey: "token")
                userDefaults.synchronize()
                self.activityIndicatorView.stopAnimating()
                
            }) { (json) -> Void in
                self.activityIndicatorView.stopAnimating()
                let alert = UIAlertController(title: "Error", message: "Invalid data", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Return", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
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
    
    func loginButtonOptions() {

        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.clearColor().CGColor
    }
    
   
    
    
}

