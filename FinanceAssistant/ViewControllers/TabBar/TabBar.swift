import UIKit
import CBTabBarController

class TabBarController: CBTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor.black
    }
}
