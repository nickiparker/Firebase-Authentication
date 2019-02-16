//
//  ViewController.swift
//  Firebase-Authentication
//
//  Created by JODIE PARKER on 09/02/2019.
//  Copyright © 2019 Nickiparker. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

class ViewController: UIViewController, FUIAuthDelegate {
    @IBOutlet weak var btnLogIn: UIButton!
    
    var authUI : FUIAuth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers : [FUIAuthProvider] = [FUIEmailAuth(), FUIGoogleAuth()]
        authUI?.providers = providers
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if error == nil {
            btnLogIn.setTitle("Logout", for: .normal)
        }
    }
//    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
//        if error == nil {
//            btnLogIn.setTitle("Log Out", for: .normal)
//        }
//    }

    @IBAction func doBtnLogIn(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            if let authVC = authUI?.authViewController() {
                present(authVC, animated: true, completion: nil)
            }
        } else {
            do {
                try Auth.auth().signOut()
                self.btnLogIn.setTitle("Log In", for: .normal)
            }
            catch {}
        }
    }
    
}

