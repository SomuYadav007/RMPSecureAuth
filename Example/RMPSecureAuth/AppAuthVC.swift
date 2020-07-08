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
//MARK: RekutenKiba Key for AppAuth(OAuth 2.0)
//=============================================
let clientID                   = "gateway"
let clientSecret               = ""
let redirectURI                =  "net.openid.appauthdemo:/oauth2redirect"
let authorization_scope        = "openid email profile"
let registration_endpoint_uri  = "https://stg-fos.rmb-ss.jp/kibadev/auth/realms/Rakuten-OSS-Stg/clients-registrations/openid-connect"
let user_info_endpoint_uri     = "https://stg-fos.rmb-ss.jp/kibadev/auth/realms/Rakuten-OSS-Stg/protocol/openid-connect/userinfo"

let issuer                     = URL(string: "https://stg-fos.rmb-ss.jp/auth/realms/Rakuten-OSS-Stg")!
let authorizationEndpoint      = URL(string: "https://stg-fos.rmb-ss.jp/kibadev/auth/realms/Rakuten-OSS-Stg/protocol/openid-connect/auth")!
let tokenEndpoint              = URL(string: "https://stg-fos.rmb-ss.jp/kibadev/auth/realms/Rakuten-OSS-Stg/protocol/openid-connect/token")!
let endSessionPointsURL        = "https://stg-fos.rmb-ss.jp/auth/realms/Rakuten-OSS-Stg/protocol/openid-connect/logout?id_token="
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
        }) { (session) in
            appDelegate.currentAuthorizationFlow = session
        }
    }
    
    @IBAction func signOutAction(_ sender: Any) {
        appDelegate.app?.signOut({ (bool) in
            if bool {
                self.lblToken.text = "LogOut Sucessfully"
            }
        })
    }
    
    @IBAction func refreshTokenAction(_ sender: Any) {
        //self.lblToken.text = appDelegate.app?.
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
