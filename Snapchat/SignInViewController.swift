//
//  SignInViewController.Swift
//  Snapchat
//
//  Created by Dadral on 13/07/17.
//  Copyright © 2017 Dadral. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func turnUpTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!,completion:{ (user, error) in
            print("we tried to sign in")
            if error != nil{
                print("we have an error")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("we tried to create a user")
                    if error != nil{
                        print("we have an eror creating user")
                    }else{
                        print("Create user successfully")
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                })
            }else{
                print("signed in Successfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        })
    }
    
    
    
}

