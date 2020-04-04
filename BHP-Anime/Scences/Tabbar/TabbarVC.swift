//
//  TabbarVC.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        configNavigationBarStyle()
        configTabbarStyle()
        // Do any additional setup after loading the view.
    }
    
    func setupTabbar() {
        let homeVC = HomeVC.loadFromNib()
        homeVC.tabBarItem = createTabbarItem(title: "Home", imageName: "home-run")
        let searchVC = SearchVC.loadFromNib()
        searchVC.tabBarItem = createTabbarItem(title: "Search", imageName: "search")
        let favoriteVC = Favorites.loadFromNib()
        favoriteVC.tabBarItem = createTabbarItem(title: "Favorite", imageName: "Vector")
        let settingVC = SettingVC.loadFromNib()
        settingVC.tabBarItem = createTabbarItem(title: "Settings", imageName: "settings")
        
        
        let homeNav = BaseNavigationController.init(rootViewController: homeVC)
        let searchNav = BaseNavigationController.init(rootViewController: searchVC)
        let favoriteNav = BaseNavigationController.init(rootViewController: favoriteVC)
        let settingNav = DarkNavigationController.init(rootViewController: settingVC)
        
        
        self.viewControllers = [homeNav, searchNav, favoriteNav, settingNav]
    }
    
    func configNavigationBarStyle() {
//        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: AppFonts.coreSansGS55Medium(18), NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configTabbarStyle() {
        self.tabBar.tintColor = AppColors.primary
           self.tabBar.backgroundColor = UIColor.white
//           self.tabBar.shadowImage = UIImage.init()
//           self.tabBar.backgroundImage = UIImage.init()
           self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = UIColor(white: 0.6, alpha: 1)
           
           self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: AppFonts.coreSansGS45Regular(12), NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
           self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: AppFonts.coreSansGS45Regular(18), NSAttributedString.Key.foregroundColor: AppColors.primary], for: .selected)
           
//           self.tabBar.layer.shadowOffset = CGSize.init(width: 0, height: 2)
//           self.tabBar.layer.shadowRadius = 2
//           self.tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
//           self.tabBar.layer.shadowOpacity = 0.3
       }

    func createTabbarItem(title: String, imageName: String) -> UITabBarItem {
        let _image = UIImage.init(named: imageName)?.withRenderingMode(.alwaysTemplate)
        let tabbarItem = UITabBarItem.init(title: title, image: _image, selectedImage: UIImage.init(named: imageName))
        return tabbarItem
    }
}
