# SGAnalytics

The SGAnalytics is a Swift framework to send analytics and track user's activities in the applications so that we can provide better functoinalities and services to users.

## Requirements
iOS 8.0+ | Xcode 8+

## Integration

Carthage (iOS 8+, OS X 10.9+)

You can use Carthage to install SGAnalytics by adding it to your Cartfile:

```
github "RigilCorp/SGAnalytics-iOS-Client" "master"
```

If you use Carthage to build your dependencies, make sure you have added SGAnalytics.framework to the "Linked Frameworks and Libraries" section of your target, and have included them in your Carthage framework copying build phase.

## Usage

**import SGAnalytics** in the class you want to track events

### SGAanalytics Instance

The SGAanalytics iOS SDK doesn't provide a instance of the SGAanalytics tracker. In order to be able to track data you have to create an instance first.

```Swift
let tracker = SGAanalytics(siteId: "23", baseURL: URL(string: "https://stratagem/analytics/piwik.php")!)
```


The `siteId` is the ID that you can get if you [add a website](https://matomo.org/docs/manage-websites/#add-a-website) within the Analytics web interface. The `baseURL` it the URL to your Analytics web instance and has to include the "piwik.php" string.

You can either pass around this instance, or add an extension to the `SGAnalytics` class and add a shared instance property.

```Swift
extension SGAanalytics {
    static let shared: SGAanalyticsTracker = SGAanalytics(siteId: "1", baseURL: URL(string: "https://example.com/piwik.php")!)
}
```

The `siteId` is the ID that you can get if you [add a website](https://matomo.org/docs/manage-websites/#add-a-website) within the SGAanalytics web interface. The `baseURL` is the URL to your SGAanalytics web instance and has to include the "piwik.php" string.

You can use multiple instances within one application.

#### Opting Out

The SGAanalytics SDK supports opting out of tracking. Please use the `isOptedOut` property of the SGAanalytics to define if the user opted out of tracking.

```Swift
tracker.isOptedOut = true
```

### Tracking


#### Tracking a screenview.

This method can be used to track hierarchical screen names, e.g. screen/settings/register. Use this to create a        
    hierarchical and logical grouping of screen views in the SGAnalytics web interface

```Swift
SGAnalytics.shared.track(view: ["path","to","your","page"])
```

You can also set the url of the page.
```Swift
let url = URL(string: "https://rigil.com/get-involved/")
SGAnalytics.shared.track(view: ["community","get-involved"], url: url)
```
  
  
#### Tracking an event.

Tracks an event as described here: https://matomo.org/docs/event-tracking/

Events can be used to track user interactions such as taps on a button. An event consists of four parts:

- Category
- Action
- Name (optional, recommended)
- Value (optional)

```Swift
SGAnalytics.shared.track(eventWithCategory: "player", action: "slide", name: "volume", value: 35.1)
```

This will log that the user slid the volume slider on the player to 35.1%.
 
 
    
 #### Setting UserId. 
 
 Will be used to associate all future events with a given userID. This property
     is persisted between app launches.

#### Sample : 
```
    SGAnalytics.shared.visitorId = "username123"
```    
    

 #### Opting out tracking. 
 
 Defines if the user opted out of tracking. When set to true, every event
     will be discarded immediately. This property is persisted between app launches.


#### Sample : 
```
    SGAnalytics.shared.isOptedOut = true // false
```   

 #### Starting a new session. 
 
A new session is started whenever the application starts. If you want to start a new session manually, you can use the `startNewSession()` function. You can, for example, start a new session whenever the user enters the application.

#### Sample : 
```
    SGAnalytics.shared.startNewSession()
 ```   
    
###  Starting dispatch process

 Manually start the dispatching process. You might want to call this method in AppDelegates `applicationDidEnterBackground` to transmit all data whenever the user leaves the application.
 

#### Sample : 
```
    SGAnalytics.shared.dispatch()
```    
