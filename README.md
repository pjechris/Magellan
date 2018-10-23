# Magellan
[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Nabigeta)

Nabigeta provides simple API to declare routes for navigation. Compatible with trait environments.

## Why

Classic app navigation tights View Controllers together, making hard to change workflow when needed.

Magellan helps you by defining a simple routing system abstracting View Controllers usage, making it easier to introduce changes, deep linking, tagging, and so on...

## Usage

### 1 - Declare an enum with your routes

```swift
enum AppRoutes {
  case book(Book)
  case cart(Cart)
}
```

### 2 - Declare your route handler

```swift
func route(for context: AppRoutes, _ sender: UIViewController?) -> Route? {
  switch context {
  case .book(let book):
    return Route(BookViewController())
  case .cart(let cart):
    return Route(CartViewController()).present(PresentationModal())
  }
}
```

### 3 - Create your navigation

```swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var navigation: Navigation! = nil

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    navigation = Navigation(router: route(for::))
  }
}
```

### 4 - Use it!

```swift

class ViewController {
  var cart: Cart!

  func onCartTapped() {
      navigate(to: .cart(cart))
  }
}
```

# Advanced Usage
## Presentation

Magellan provides some default Presentation strategies:

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
  cartViewController.navigationTerminated(status: .canceled) // dismiss CartViewController
```

You can also be notified when navigations are stopped:

```swift
  viewController
    .navigate(to: .cart(self.cart))
    .onTerminate { status in
      if status == .canceled {
        print("author controller cancelled")
      }
    }
```
