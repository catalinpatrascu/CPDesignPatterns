import Foundation

enum SingletonError: CustomStringConvertible, Error {
    case onlyApplicableToClass
    
    var description: String {
        switch self {
        case .onlyApplicableToClass:
            return "@Singleton can only be applied to a class"
        }
    }
}
