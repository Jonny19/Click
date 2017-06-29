//
//  SignInVC.swift
//  Click
//
//  Created by Jonathan Uttankar on 27/06/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Jonny: Unable to authenticate with facebook -\(error)")
            } else if result?.isCancelled == true {
                print("Jonny: User cancelled facebook authentication")
            } else {
                print("Jonny: Successfully Authenticated with facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                firebaseAuth(credential)
            }
        }
        
        func firebaseAuth(_ credential: FIRAuthCredential) {
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                if error != nil {
                    print("Jonny: Unable to authenticate with firebase -\(error)")
                } else {
                    print("Jonny: Successfully authenticate with firebase")
                }
            })
        }
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Jonny: Email User Authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Jonny: Unable to authenticate with firebase")
                        } else {
                            print("Jonny: Successfully authenticated with firebase")
                        }
                    })
                }
            })
        }
        
    }
}

