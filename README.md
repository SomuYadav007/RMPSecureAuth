# RMPSecureAuth

[![CI Status](https://img.shields.io/travis/somuyadav007/RMPSecureAuth.svg?style=flat)](https://travis-ci.org/somuyadav007/RMPSecureAuth)
[![Version](https://img.shields.io/cocoapods/v/RMPSecureAuth.svg?style=flat)](https://cocoapods.org/pods/RMPSecureAuth)
[![License](https://img.shields.io/cocoapods/l/RMPSecureAuth.svg?style=flat)](https://cocoapods.org/pods/RMPSecureAuth)
[![Platform](https://img.shields.io/cocoapods/p/RMPSecureAuth.svg?style=flat)](https://cocoapods.org/pods/RMPSecureAuth)

`RMPSecureAuth` is a `AppAuth` extension framework, which is using to reduce the appauth code,Directly providing the short method of Sign-in and Sign-Out, No need to manage authetication code which is directly managing by `AppAuth` framework.Some Features of `RMPSecureAuth`:
     
 1. You can directly access Sign-in and Sign-Out methods.
 2. You can access refresh token with AppAuth State.
 3. You can get refresh token by Api Call and can access api by app auth state.
 4. This RMPSecureAuth will manage your AppAuth state, save and remove your token.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
`iOS 9.0 or later`
`Swift 4.2`

## Installation

RMPSecureAuth is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RMPSecureAuth', '~> 0.1.6'
```
## Usage

import framework RMPSecureAuth and write this code in AppDelegate

```swift
import RMPSecureAuth
import AppAuth

 
  var currentAuthorizationFlow: OIDExternalUserAgentSession?
  var objAppAuth: AppAuth?

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
            
 })

```
Sign-Out:
```swift
appDelegate.app?.signOut({ (bool) in
  if bool {
    
  }
}, { (statusCode,error) in
    
})
```

For Refresh token and accessToken you can use like this:
```swift
AppAuth.authState?.lastTokenResponse?.refreshToken
AppAuth.authState?.lastTokenResponse?.accessToken
```

Reference:

https://github.com/openid/AppAuth-iOS.

https://developer.forgerock.com/docs/platform/how-tos/implementing-oauth-20-authorization-code-grant-protected-pkce-appauth-sdk-ios.

https://www.raywenderlich.com/243-oauth-2-0-with-swift-tutorial.


## Author

Somu Yadav, Somendra.sy@gmail.com

## License

RMPSecureAuth is available under the MIT license. See the LICENSE file for more info.
