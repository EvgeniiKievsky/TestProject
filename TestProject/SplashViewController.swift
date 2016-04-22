//
//  SplashViewController.swift
//  TestProject
//
//  Created by Evgenii Kievsky on 4/22/16.
//  Copyright © 2016 Evgenii Kievsky. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    let segue: SplashSegue(showApp, source: self, destination: ViewController)
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "", userInfo: nil, repeats: true)
    }

    func show() {
        self.performSegueWithIdentifier("showApp", sender: self)
    }

}
