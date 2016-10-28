# CHANGELOG

# 0.9.0

## Enhancements

- [navigation] Router block can returns nil (no `Route` found) and receives sender as param.
- [controller] Search navigation in parent controller if nil.
- [navigation] We removed context from `NavigationContext` because it could lead to memory leaks if controllers were pop manually. 

## Bugfixes

- Fixed crash with `AnyNavigatable`

# 0.8.0

## Added

- Added protocol `Navigable` to which your controllers need to conform to.
- [Route] You can precise a storyboard `UIViewController` identifier.
- [Navigation] Added root parameter to `init`. Use it to pass your application root controller.
- [Navigation] You can now stop navigations (`navigateBack(to:)` and `navigateBack(from:,status:)`)

## Enhancements

- [Controller] `prepareForSegue:sender:` is no more swizzled.
- [Navigation] You don't need to provide any name key to navigate anymore.
- [Navigation] Renamed `navigate` to `navigateTo`.

## Bugfixes

- [Navigation] Fixed `router` visibility.


# 0.7.0

## Added

## Enhancements

- [language] Dropped ObjC support.
- [route] Use (modular) syntax block to declare matching routes.
- [code] Removed classes, symplifying code.

## Bugfixes
