# Movies App
Movies App is an iOS app which makes a request and shows a list and grid views for Movies and its various details.

The app is based on MVVM architecture.

### Built with: 
Xcode 10.1

Swift 4.2

Deployment target: iOS 11.0+

Device: iPhone only

### Pods used:
SDWebImage

youtube-ios-player-helper

Note:
We have created a singleton class for showing Activity Indicator. This approach is better when we have multiple UIViewControllers where we need to show Activity Indicator. In this project we have only one UIViewController where we need to show Activity Indicator, but for the architecture purpose we have created a singleton class here.
