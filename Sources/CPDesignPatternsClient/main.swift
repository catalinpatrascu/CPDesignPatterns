import CPDesignPatterns

//@Singleton
//struct Logger { }

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
