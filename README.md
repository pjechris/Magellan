# Nabigeta
[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Nabigeta)

Nabigeta provides simple API to declare routes for navigation. Compatible with trait environments.

## Usage

Declare your routes into a file, like your `AppDelegate`.

```swift
import Nabigeta

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var navigation: Navigation! = nil

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.navigation = Navigation(traitProvider: self.window!)

    self.navigation.router = { context in
        switch(context) {
          case is Author:
            return Route(AuthorViewController.self)

          case is Book:
            return Route(BookViewController.self)
              .present { trait in
                  switch(trait.horizontalClass, trait.verticalClass) {
                    case (.Compact, .Compact):
                      return PresentationPush()
                    default:
                      return PresentationModal()
                  }
              }
        }
    }
  }
}

class AuthorViewController : UIViewController, Navigable {
    func didNavigate(to author: Author) {
      print("Navigated to /(author.name) controller")
    }
}

class BookViewController {
  func didTapAuthor() {
    self.navigate(to: self.author) // AuthorViewController is displayed!
  }
}

```
# Advanced Usage
## Presentation

Nabigeta provides some default Presentation strategies:

- PresentationPush
- PresentationModal
- PresentationPopover
- PresentationSegue

If none of them feed your needs, you can provide your own custom presentation just by creating a class/struct implementing the ```PresentationStrategy``` protocol.

## Stopping navigation
### Navigate back

You can cancel navigation from source controller:

```swift
  bookViewController.navigateBack() // come back to BookViewController
```
You can also stop navigation from destination controller:

```swift
  authorViewController.navigationTerminated(status: .Canceled) // dismiss AuthorViewController
```

You can also be notified when navigations are stopped:

```swift
  bookViewController
    .navigate(to: self.author)
    .onTerminate { status in
      if status == .Canceled {
        print("author controller cancelled")
      }
    }
```
