extension UIViewController {
    static let swizzle: Void = {
        let originalSelector = class_getInstanceMethod(UIViewController.self, #selector(viewDidLoad))
        let swizzledSelector = class_getInstanceMethod(UIViewController.self, #selector(swizzled_viewDidLoad))
        method_exchangeImplementations(originalSelector!, swizzledSelector!)
    }()
    
    @objc func swizzled_viewDidLoad() {
        swizzled_viewDidLoad()
        print("Swizzled viewDidLoad method in \(String(describing: type(of:self)))")
    }
}