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
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "FeedVC", sender: nil)
        }
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
                    if let user = user {
                        let userData = ["provider": credential.provider]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                }
            })
        }
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("Jonny: Email User Authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Jonny: Unable to authenticate with firebase")
                        } else {
                            print("Jonny: Successfully authenticated with firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
        
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
       DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
       let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
       print("Jonny: Data saved to keychain \(keychainResult)")
        performSegue(withIdentifier: "FeedVC", sender: nil)
    }
}

