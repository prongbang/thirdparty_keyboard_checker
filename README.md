# thirdparty_keyboard_checker

[![pub package](https://img.shields.io/pub/v/thirdparty_keyboard_checker.svg)](https://pub.dartlang.org/packages/thirdparty_keyboard_checker)

Check the application using a 3rd-party keyboard on Android. Implement a simple function to disable 3rd-party keyboards for iOS.

## Getting Started

It is really easy to use! You should ensure that you add the `thirdparty_keyboard_checker` as a dependency in your flutter project.

```yaml
thirdparty_keyboard_checker: "^1.0.0"
```

## Usage

#### New instance

```dart
final _thirdPartyKeyboardChecker = ThirdPartyKeyboardChecker.instance;
```

#### Android

```dart
final is3rdKeyboard = await _thirdPartyKeyboardChecker.check3rdKeyboard();
if (is3rdKeyboard) {
  showDialog('Your application is using a 3rd-party keyboard');
}
```

#### iOS

Add this code in your `AppDelegate.swift`

- Swift 5

```swift
override func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
    return extensionPointIdentifier != UIApplication.ExtensionPointIdentifier.keyboard
}
```

- Swift 4.2

```swift
override func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
    return !extensionPointIdentifier == UIApplication.ExtensionPointIdentifier.keyboard
}
```

- Swift 4

```swift
override func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplicationExtensionPointIdentifier) -> Bool {
    return !extensionPointIdentifier == UIApplicationExtensionPointIdentifier.keyboard
}
```

- Swift 3

```swift
override func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplicationExtensionPointIdentifier) -> Bool {
    return !extensionPointIdentifier == UIApplicationExtensionPointIdentifier.keyboard
}
```