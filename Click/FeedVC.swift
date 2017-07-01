//
//  FeedVC.swift
//  Click
//
//  Created by Jonathan Uttankar on 01/07/17.
//  Copyright © 2017 Jonathan Uttankar. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("Jonny: UID removed successfully \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "SignInVC", sender: nil)
    }

}
