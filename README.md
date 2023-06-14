<span align="center">
  <br>
<img src="https://developer.apple.com/assets/elements/icons/swift/swift-96x96_2x.png" width="100">
  <br>
</span>

# CPDesignPatterns: Design Patterns Macros for Swift

A collection of macros to help developers annotate and apply faster design patterns.

It started as a playground for macros, having only Singleton implemented, hopefully more to come.

Check below for some examples on how to use it. 

<p align="center">
    <img src="https://github.com/catalinpatrascu/CPDesignPatterns/blob/main/Resources/Main-screenshot.jpg" style="display: block; margin: auto;"/>
</p>

## Prerequisites

### Swift

* Swift 5.9

### macOS

* macOS 10.15 or higher.

### iOS

* iOS 13.0 or higher

### tvOS

* tvOS 13.0 or higher

### watchOS

* watchOS 6.0 or higher

## Using CPDesignPatterns

### Including it in your project

#### Swift Package Manager

To include CPDesignPatterns into a Swift Package Manager package, add it to the `dependencies` attribute defined in your `Package.swift` file. You can select the version using the `majorVersion` and `minor` parameters. For example:
```
    dependencies: [
        .Package(url: "https://github.com/catalinpatrascu/CPDesignPatterns.git", majorVersion: <majorVersion>, minor: <minor>)
    ]
```

### Usages Examples

The following examples shows how to use it:
```swift
    @Singleton
    class LoggerV1 {
        func doSomeLogging(_ eventName: String) { }
    }

    @Singleton
    public class LoggerV2 {
    }

    @Singleton
    open class LoggerV3 {
    }

    @Singleton
    final public class LoggerV4 {
    }
```

## License

This library is licensed under MIT License. Full license text is available in [LICENSE](https://github.com/catalinpatrascu/CPDesignPatterns/blob/main/LICENSE).
