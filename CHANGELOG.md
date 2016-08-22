# CHANGELOG

# WIP

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
