import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct CPDesignPatternsPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SingletonMacro.self,
    ]
}
