# Nabigeta
[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Nabigeta)

```ruby
pod install Nabigeta
```

Nabigeta is a routing solution providing an API to declare routes (logic) to navigate to (UI).
It is compatible with trait environments.

To use Nabigeta, juste instanciate a ```Navigation```object with some routes:

```swift

let collection = NavigationCollection()
let navigation = Navigation(collection: collection)

collection.routes.add(Route("author", AuthorViewController.self))

```

Then just reference it when you want navigate to the route:

```swift
let author = Author(name: "Nabigeta")
navigation.navigate("home", context: author, sender: self)
```

Nabigeta will then automatically present the route associated view controller the right way (by default, as a Pushed view controller).

# Advanced Usage
## Context

## Define how to present

By default Nabigeta display view controllers as push. You can however configure this behaviour by passing a ```PresentationStrategy``` to your route:

```swift
collection.routes.add(Route("author", AuthorViewController.self, presentation: PresentationModal()))
```

Using the ```presentation``` argument Nabigeta will now display author as a modal.

Nabigeta provides some default Presentation strategies (take a look to the doc and/or the ```init``` to see their respective options):

- PresentationPush
- PresentationModal
- PresentationPopover
- PresentationSegue

If none of them feed your needs, you can provide your own custom presentation just by creating a class/struct implementing the ```PresentationStrategy``` protocol.

## Adaptive presentation

Sometimes defining one presentation is not enough as your view controller might be displayed on
multiple orientations (portrait/landscape) on multiple devices (iPhone/iPad). You can add **extra**
presentation using ```NavigationCollection```

```swift
// presentations are defined against view controllers, and not routes
collection.presentations.when(to: AuthorViewController.self) { pres in
  pres.addAdaptivePresentation(PresenationPopover(), .Regular, .Regular) // iPad
  pres.addAdptivePresentation(PresenationPopover(), .Regular, .Compact) // iPhone6+
}
```

You can even define more complex adaptive presentations:

```swift

// We define presentation when coming from specific view controller
collection.presentations.when(from: LoginViewController, to: AuthorViewController.self) { pres in
  pres.addAdaptivePresentation(PresenationModal(), .Regular, .Regular) // iPad
}

```
