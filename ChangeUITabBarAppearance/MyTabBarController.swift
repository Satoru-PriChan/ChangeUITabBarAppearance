//
//  ViewController.swift
//  ChangeUITabBarAppearance
//
//  Created by USER on 2019/04/04.
//  Copyright © 2019 SoLaMi Smile. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Each content view controller
        let leftMostVC = LeftMostViewController()
        let midLeftVC = MiddleLeftViewController()
        let midRightVC = MiddleRightViewController()
        let rightMostVC = RightMostViewController()
        
        //Set tab bar items
        leftMostVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 0)
        midLeftVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.favorites, tag: 1)
        midRightVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.history, tag: 2)
        rightMostVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 3)
        
        //Set them into UITabBarController
        let vcList = [leftMostVC, midLeftVC, midRightVC, rightMostVC]
        let vcMap = vcList.map{UINavigationController.init(rootViewController: $0)}
        self.viewControllers = vcMap
        
        //Change tabbar shape
        self.changeTabBarShape()
        
    }
    
    ///Function to change TabBar shape.
    func changeTabBarShape() {
        let shapeLayer = CAShapeLayer()
        
        //Get CGPath
        shapeLayer.path = self.createLengthExpandShape()
        
        //Set image
        shapeLayer.fillColor = UIColor.init(patternImage: UIImage.init(named: "MyImage.png")!).cgColor
        
        //Set layer
        self.tabBar.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    /// Function to get the CGPath which expands length from original size.
    ///
    /// - Returns: A CGPath whose shape is expanded.
    func createLengthExpandShape() -> CGPath {
        let path = UIBezierPath()
        
        //Starting point (left top) then draw lines until the it returns to the starting point with close().
        let startX: CGFloat = 0
        let startY: CGFloat = -37
        path.move(to: CGPoint.init(x: startX, y: startY))
        path.addLine(to: CGPoint.init(x: self.tabBar.frame.width, y: startY))
        path.addLine(to: CGPoint.init(x: self.tabBar.frame.width, y: self.tabBar.frame.height))
        path.addLine(to: CGPoint.init(x: startX, y: self.tabBar.frame.height))
        path.close()
        
        return path.cgPath
    }


}

