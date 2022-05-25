import Foundation

// Method Swizzling in Swift
// 會用extension來實現是模擬既使沒有source code, 仍有辦法實現

// 1. NSObject + Dynamic
extension Super {
    static func swizzle() {
        let oriSelector = #selector(Super.oriMethod)
        let swiSelector = #selector(Super.swizzleMethod)
        if let oMethod = class_getInstanceMethod(Super.self, oriSelector),
           let sMethod = class_getInstanceMethod(Super.self, swiSelector) {
            method_exchangeImplementations(oMethod, sMethod)
        }
    }
    
    @objc
    func swizzleMethod() {
        print("Super swizzle")
    }
}

// 2. @_dynamicReplacement(for: )
extension Top {
    @_dynamicReplacement(for: oriMethod())
    func swizzleMethod() {
        print("Top swizzle")
    }
}
