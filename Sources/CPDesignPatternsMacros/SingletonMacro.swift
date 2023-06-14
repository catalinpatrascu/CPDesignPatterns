import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `Singleton` macro, which takes a class with
/// different visibility modifiers and produces a the code for a Singleton implementation
/// of that class, allowing you to focus on the actual methods. For example
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
public struct SingletonMacro: MemberMacro {
    public static func expansion(
        of attribute: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let classDeclaration = declaration.as(ClassDeclSyntax.self) else {
            throw SingletonError.onlyApplicableToClass
        }
        
        let className = classDeclaration.identifier.text
        let classModifiers = classDeclaration.modifiers
        
        return try SingletonMacroHelper.makeSingletonSyntax(initDeclarationSyntax: "private init()",
                                                            entityName: className,
                                                            entityModifiers: classModifiers)
    }
}
