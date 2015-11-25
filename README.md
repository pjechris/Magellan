# Nabigeta
[![Build Status](https://travis-ci.org/akane/Gaikan.svg?branch=travis)](https://travis-ci.org/akane/Nabigeta)

```ruby
pod install Nabigeta
```

Nabigeta is a routing solution for iOS which provides a simple API to declare routes
to navigate to.

It decouples your application logic (where can I navigate to?) from the presentation logic (how I do navigate there?).
It is compatible with trait environments.

To use Nabigeta, juste instance a ```Navigation```object with your declared routes:

```swift

let collection = NavigationCollection()
let navigation = Navigation(collection: collection)

collection.routes.add(Route("author", AuthorViewController.self))

```

Then just reference it when you want to show the view controller:

```swift
let author = Author(name: "Nabigeta")
navigation.navigate("home", context: author, sender: self)
```

Nabigeta will automatically handle how to display the view controller. Here it will just push it.

# Advanced Usage
## Context

## Define how to present

By default Nabigeta display view controllers as push. You can however configure this behaviour:

```swift
collection.routes.add(Route("author", AuthorViewController.self, presentation: PresentationModal()))
```

Using the ```presentation``` argument Nabigeta will now display author as a modal. You can define your
custom presentation behaviour but Nabigeta comes with some bundled:

- PresentationPush
- PresentationModal
- PresentationPopover
- PresentationSegue

Take a look to the doc and/or the ```init``` to see their respective options.

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
