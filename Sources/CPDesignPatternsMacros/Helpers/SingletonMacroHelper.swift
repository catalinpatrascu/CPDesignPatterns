import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

enum SingletonMacroHelper {
    static func makeSingletonSyntax(initDeclarationSyntax: PartialSyntaxNodeString,
                                    entityName: String,
                                    entityModifiers: ModifierListSyntax?) throws -> [DeclSyntax] {
        let modifierListSyntax = ModifierListSyntax {
            if entityContainsExtraVisibilityModifiers(entityModifiers) {
                DeclModifierSyntax(name: .keyword(.public))
            }
            
            DeclModifierSyntax(name: .keyword(.static))
        }
        
        let staticInstance = VariableDeclSyntax(
            modifiers: modifierListSyntax,
            bindingKeyword: instanceKeyword,
            bindings: [
                makeVariableDeclarationInitialize(variableName: instanceVariableName, entityName: entityName)
            ]
        )
        
        let initializer = try InitializerDeclSyntax(initDeclarationSyntax) { }
        
        return [DeclSyntax(staticInstance), DeclSyntax(initializer)]
    }
    
    // MARK: - Private
    
    private static let instanceKeyword = TokenSyntax.keyword(.let)
    private static let instanceVariableName = "instance"
    
    private static func entityContainsExtraVisibilityModifiers(_ entityModifiers: ModifierListSyntax?) -> Bool {
        guard let entityModifiers else { return false }
        
        let validVisibilityModifiers = entityModifiers
            .compactMap { $0.name.text }
            .filter {
                $0 == TokenSyntax.keyword(.public).text ||
                $0 == TokenSyntax.keyword(.open).text
            }
        
        return !validVisibilityModifiers.isEmpty
    }
    
    private static func makeVariableDeclarationInitialize(variableName: String,
                                                          entityName: String) -> PatternBindingSyntax {
        PatternBindingSyntax(
            pattern: IdentifierPatternSyntax(identifier:.identifier(variableName)),
            initializer: InitializerClauseSyntax(equal:.equalToken(),
                                                 value: makeFunctionCallSyntax(entityName))
        )
    }
    
    private static func makeFunctionCallSyntax(_ functionName: String) -> FunctionCallExprSyntax {
        FunctionCallExprSyntax(calledExpression: IdentifierExprSyntax(identifier: .identifier(functionName)),
                               leftParen: .leftParenToken(),
                               argumentList: TupleExprElementListSyntax(),
                               rightParen: .rightParenToken())
    }
}
