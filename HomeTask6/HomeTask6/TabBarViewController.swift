//
//  TabBarViewController.swift
//  HomeTask6
//
//  Created by Светлана Мухина on 08.03.2022.
//

import UIKit

class TabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTab()
        customBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tabOne = UINavigationController(rootViewController: AutoLayoutViewController())
        let tabTwo = UINavigationController(rootViewController: XXibViewController(nibName: "XXibView", bundle: nil))
        let tabThree = UINavigationController(rootViewController: ManualViewController())
        let tabFour = UINavigationController(rootViewController: NavigationViewController())
        let tabFive = UINavigationController(rootViewController: LargeNavigationViewController())
        
        tabOne.title = "Auto Layout"
        tabTwo.title = "XIB"
        tabThree.title = "Manual"
        tabFour.title = "Navigation"
        tabFive.title = "Large"
//        tabFive.tabBarItem = UITabBarItem(title: "Large navigation", image: UIImage(systemName: "ant")!, selectedImage: UIImage(systemName: "ant")!)
        
        setViewControllers([tabOne, tabTwo, tabThree, tabFour, tabFive], animated: true)
        
        let images = ["hare", "tortoise", "ladybug", "pawprint", "ant"]
        let selectedImages = ["suit.heart", "suit.heart", "suit.heart","suit.heart", "suit.heart"]
        guard let items = tabBar.items else { return }
        for x in 0..<items.count{
           // items[x].badgeValue = "1"
            //items[x].badgeColor = .blue
            items[x].image = UIImage(systemName: images[x])
            items[x].selectedImage = UIImage(systemName: selectedImages[x])
        }
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    private func customBar(){
        UINavigationBar.appearance().backgroundColor = .systemMint
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
    private func customTab(){
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .systemMint
        tabBar.standardAppearance = apperance
        setTabBarItemColors(apperance.stackedLayoutAppearance)
        setTabBarItemColors(apperance.inlineLayoutAppearance)
        setTabBarItemColors(apperance.compactInlineLayoutAppearance)
        self.tabBar.standardAppearance = apperance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
   private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
       itemAppearance.normal.iconColor = .red
       itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
          itemAppearance.selected.iconColor = .black
       itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
       
   }
}
