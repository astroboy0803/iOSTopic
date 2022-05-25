import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aSuper = Super()
        aSuper.oriMethod()
        Super.swizzle() // 執行後就會換掉, 所有instance(已建立或之後建立)都會生效
        aSuper.oriMethod()
        let bSuper = Super()
        bSuper.oriMethod()
        
        let aTop = Top()
        aTop.oriMethod()
    }
}

