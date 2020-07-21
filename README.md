# RMPSecureAuth

[![CI Status](https://img.shields.io/travis/somuyadav007/RMPSecureAuth.svg?style=flat)](https://travis-ci.org/somuyadav007/RMPSecureAuth)
[![Version](https://img.shields.io/cocoapods/v/RMPSecureAuth.svg?style=flat)](https://cocoapods.org/pods/RMPSecureAuth)
[![License](https://img.shields.io/cocoapods/l/RMPSecureAuth.svg?style=flat)](https://cocoapods.org/pods/RMPSecureAuth)
[![Platform](https://img.shields.io/cocoapods/p/RMPSecureAuth.svg?style=flat)](https://cocoapods.org/pods/RMPSecureAuth)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
`iOS 9.0 or later`
`Swift 4.2`

## Installation

RMPSecureAuth is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RMPSecureAuth', '~> 0.1.2'
```
## Usage

import framework AppauthWrapper and write this code in AppDelegate

```swift
import AppauthWrapper
import AppAuth

 /*   ************ AppauthWrapper ********** AppAuth **************
  *
  * Your App has check current autherization session
  *
  * Set current autherization session in didFinishLaunching method
  *
  */
  var currentAuthorizationFlow: OIDExternalUserAgentSession?
  var objAppAuth: AppAuth?
 
  //MARK: CurrentAutherization Flow
  /*
   * Sends the URL to the current authorization flow (if any) which will
   *
   */
   func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if let authorizationFlow = self.currentAuthorizationFlow,
            authorizationFlow.resumeExternalUserAgentFlow(with: url) {
            self.currentAuthorizationFlow = nil
            return true
        }
        // Your additional URL handling (if any)
        
        return false
    }
...
```

Make a constant file and write this var(s)

```swift
let clientID                   = ""
let clientSecret               = ""
let redirectURI                = ""
let authorization_scope        = ""
let registration_endpoint_uri  = ""
let user_info_endpoint_uri     = ""

let issuer                     = ""
let authorizationEndpoint      = ""
let tokenEndpoint              = ""
let endSessionPointsURL        = ""

```

Before Sign-in method call you have to initialize AppAuth Class, you can initialize in `AppDelegate` or if you want more optimization you can write before Sign-In. 
```swift
(UIApplication.shared.delegate as! AppDelegate).objAppAuth = AppAuth(
            clientID,
            clientSecret,
            redirectURI,
            authorization_scope,
            registration_endpoint_uri,
            user_info_endpoint_uri,
            issuer,
            authorizationEndpoint,
            tokenEndpoint,
            endSessionPointsURL
 )
```

You can use Sign-In & Sign-Out like this

Sign-In: 
```swift
 appDelegate.app?.signIn(self, { (bool) in
   if bool {

   }
 }, { (session) in
  appDelegate.currentAuthorizationFlow = session
 }, { (statusCode,error) in
            print(statusCode ?? 0,error)
 })

```
Sign-Out:
```swift
appDelegate.app?.signOut({ (bool) in
  if bool {
    
  }
}, { (statusCode,error) in
    print(statusCode ?? 0,error)
})
```

For Refresh token and accessToken you can use like this:
```swift
AppAuth.authState?.lastTokenResponse?.refreshToken
AppAuth.authState?.lastTokenResponse?.accessToken
```

Refernces:

https://github.com/openid/AppAuth-iOS.

https://developer.forgerock.com/docs/platform/how-tos/implementing-oauth-20-authorization-code-grant-protected-pkce-appauth-sdk-ios.

https://www.raywenderlich.com/243-oauth-2-0-with-swift-tutorial.


## Author

Somu Yadav, Somendra.sy@gmail.com

## License

RMPSecureAuth is available under the MIT license. See the LICENSE file for more info.
