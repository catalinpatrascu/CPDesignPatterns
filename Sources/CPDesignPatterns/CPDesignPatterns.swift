// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro which takes a class with different visibility modifiers and
/// produces the code for a Singleton implementation of that class,
/// allowing you to focus on the actual methods. For example:
///
///     @Singleton
///     public class Logger {
///     }
///
///     will expand to:
///
///     public class Logger {
///         public static let instance = Logger()
///
///         private init() {
///         }
///     }
@attached(member, names: named(instance), named(init))
public macro Singleton() = #externalMacro(module: "CPDesignPatternsMacros", type: "SingletonMacro")
