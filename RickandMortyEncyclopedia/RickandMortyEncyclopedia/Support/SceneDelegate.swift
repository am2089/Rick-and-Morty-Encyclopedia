//
//  SceneDelegate.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/17/22.
//

import UIKit
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

        var window: UIWindow?
        
        


        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window?.windowScene = windowScene
            window?.rootViewController = createTabbar()
            window?.makeKeyAndVisible()
            
            
            
        }
        
        // Functions that create Tab bar items
        func createSearchNC() -> UINavigationController {
            let searchVC = SearchVC()
           searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
            searchVC.title = "Search Characters"
            return UINavigationController(rootViewController: searchVC)
        }
        
     
        
        
        func createTabbar() -> UITabBarController {
            let tabbar = UITabBarController()
            UITabBar.appearance().tintColor = .systemGreen
            tabbar.viewControllers = [createSearchNC()]
            
            if #available(iOS 13.0, *) {
               let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
               tabBarAppearance.configureWithDefaultBackground()
               if #available(iOS 15.0, *) {
                  UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
               }
            }
            
            return tabbar
        }
        
        
        

        func sceneDidDisconnect(_ scene: UIScene) {
          
        }

        func sceneDidBecomeActive(_ scene: UIScene) {
           
        }

        func sceneWillResignActive(_ scene: UIScene) {
          
        }

        func sceneWillEnterForeground(_ scene: UIScene) {
            
        }

        func sceneDidEnterBackground(_ scene: UIScene) {
        }


    }
