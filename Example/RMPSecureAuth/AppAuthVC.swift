//
//  ViewController.swift
//  RMPSecureAuth
//
//  Created by somuyadav007 on 07/08/2020.
//  Copyright (c) 2020 somuyadav007. All rights reserved.
//

import UIKit
import RMPSecureAuth
import AppAuth

//=============================================
//MARK: Key for AppAuth(OAuth 2.0)
//=============================================
let clientID                   = ""
let clientSecret               = ""
let redirectURI                = ""
let authorization_scope        = ""
let registration_endpoint_uri  = ""
let user_info_endpoint_uri     = ""

let issuer                     = URL(string: "")!
let authorizationEndpoint      = URL(string: "")!
let tokenEndpoint              = URL(string: "")!
let endSessionPointsURL        = ""
let appDelegate                = UIApplication.shared.delegate as! AppDelegate

class AppAuthVC: UIViewController {

    //==============================
    //MARK: @IBOutlet(s)
    //==============================
    @IBOutlet weak var lblToken: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignOut: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//==============================
//MARK: AppAuthVC Action(s)
//==============================
extension AppAuthVC {
    @IBAction func signInAction(_ sender: Any) {
        appDelegate.app?.signIn(self, { (bool) in
            if bool {
                self.lblToken.text = "Login Sucessfully"
            }
        }, { (session) in
            appDelegate.currentAuthorizationFlow = session
        }, { (statusCode,error) in
            
        })
    }
    
    @IBAction func signOutAction(_ sender: Any) {
        appDelegate.app?.signOut({ (bool) in
            if bool {
                self.lblToken.text = "LogOut Sucessfully"
            }
        }, { (statusCode,error) in

        })
    }
    
    @IBAction func refreshTokenAction(_ sender: Any) {
       
    }
}

//==============================
//MARK: AppAuthVC func(s)
//==============================
extension AppAuthVC {
    func signInShow() {
        self.btnSignIn.isHidden  = true
        self.btnSignOut.isHidden = false
    }
    
    func signOutShow() {
        self.btnSignIn.isHidden  = false
        self.btnSignOut.isHidden = true
    }
}
