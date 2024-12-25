import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
//        if let customTabBar = self.tabBar as? CustomTabBar {
//            customTabBar.tintColor = .label
//        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let customTabBar = tabBar as? CustomTabBar else { return }
        let selectedIndex = tabBarController.selectedIndex
        customTabBar.playAnimation(for: selectedIndex)
        //print("Clicked")
    }
}
