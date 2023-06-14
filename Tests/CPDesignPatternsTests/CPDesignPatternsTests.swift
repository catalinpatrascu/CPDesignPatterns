import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import CPDesignPatternsMacros

let testMacros: [String: Macro.Type] = [
    "Singleton": SingletonMacro.self,
]

final class CPDesignPatternsTests: XCTestCase {
    func test_singleton_withStructThrowsError() {
        assertMacroExpansion(
            """
            @Singleton
            struct Logger {
            }
            """,
            expandedSource: """
            
            struct Logger {
            }
            """,
            diagnostics: [
                DiagnosticSpec(message: "@Singleton can only be applied to a class", line: 1, column: 1)
            ],
            macros: testMacros
        )
    }
    
    func test_singleton_withClass() {
        assertMacroExpansion(
            """
            @Singleton
            class Logger {
            }
            """,
            expandedSource: """
            
            class Logger {
                static let instance = Logger()
                private init() {
                }
            }
            """,
            macros: testMacros
        )
    }
    
    func test_singleton_withPublicClassWillCreatePublicInstance() {
        assertMacroExpansion(
            """
            @Singleton
            public class Logger {
            }
            """,
            expandedSource: """
            
            public class Logger {
                public static let instance = Logger()
                private init() {
                }
            }
            """,
            macros: testMacros
        )
    }
    
    func test_singleton_withOpenClassWillCreatePublicInstance() {
        assertMacroExpansion(
            """
            @Singleton
            open class Logger {
            }
            """,
            expandedSource: """
            
            open class Logger {
                public static let instance = Logger()
                private init() {
                }
            }
            """,
            macros: testMacros
        )
    }
}
