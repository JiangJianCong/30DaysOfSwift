//
//  LoginViewController.swift
//  Project04-LoginPage
//
//  Created by space on 2018/4/22.
//  Copyright © 2018年 space. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func backButtonDIdTouch (_ sender : AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonDidTouch(_ sender: AnyObject) {
        let bounds = self.loginButton.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.00, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
            
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 80, height: bounds.size.height)
            self.loginButton.isEnabled = true
        }, completion: { finished in self.loginButton.isEnabled = true
            
        })
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
