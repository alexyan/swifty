//
//  RootViewController.swift
//  swifty
//
//  Created by 想当当 on 14-6-16.
//  Copyright (c) 2014年 想当当. All rights reserved.
//

import UIKit

struct Static {
    static var token: dispatch_once_t = 0
}

class RootViewController: UITabBarController, UITabBarControllerDelegate {
    

    var rootNavigationController: UINavigationController? ,
        rootListViewController: UINavigationController? ,
        indexViewController: IndexViewController? ,
        listViewController: ListViewController? ,
        welcomeViewController: WelComeViewController?
    
    //var notificationCenter = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        // Do any additional setup after loading the view.
        //self.view.backgroundColor = UIColor(hex:0x1A1F21)
        self.welcomeViewController = WelComeViewController()

        
        self.indexViewController = IndexViewController()
        self.rootNavigationController = UINavigationController(rootViewController:indexViewController!)
        //self.rootNavigationController!.tabBarItem.image = UIImage(named: "swift-hero.png")
        self.rootNavigationController!.tabBarItem = UITabBarItem(title: "首页", image:UIImage(named:"Home.png"), selectedImage:nil)
        //self.rootNavigationController!.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

        
        //navigationBar settings
        //self.rootNavigationController!.navigationBar.titleTextAttributes = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        self.rootNavigationController!.navigationBar.barTintColor = UIColor(hex:0x1A1F21)
        self.rootNavigationController!.navigationBar.tintColor = UIColor(hex:0xffffff)
        //self.rootNavigationController!.navigationBar.backgroundColor = UIColor(hex:0x1A1F21)
        self.rootNavigationController!.navigationBar.alpha = 1
        //self.rootNavigationController!.navigationBar.translucent = false
        


        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName : UIFont(name:"Helvetica",size:16),
            NSForegroundColorAttributeName : UIColor(hex:0xffffff)
        ]
        
        
        //self.rootNavigationController!.navigationBar.backgroundColor = UIColor(hex:0x1A1F21)
        //self.rootNavigationController!.navigationBar.titleTextAttributes = UIColor(hex:0x000000)
        
        //self.delegate = self
        
        self.listViewController = ListViewController()
        self.listViewController!.tabBarItem.title = "世界杯"
        self.listViewController!.tabBarItem = UITabBarItem(title: "世界杯", image:UIImage(named:"Football.png"), selectedImage:nil)
        
        self.rootListViewController = UINavigationController(rootViewController:self.listViewController!)
        
        //navigationBar settings
        //self.rootNavigationController!.navigationBar.titleTextAttributes = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        self.rootListViewController!.navigationBar.barTintColor = UIColor(hex:0x1A1F21)
        self.rootListViewController!.navigationBar.tintColor = UIColor(hex:0xffffff)
        //rootListViewController!.navigationBar.backgroundColor = UIColor(hex:0x1A1F21)
        self.rootListViewController!.navigationBar.alpha = 1
        //rootListViewController!.navigationBar.translucent = false

        
        self.setViewControllers([self.rootNavigationController!,self.rootListViewController!],animated:true)

        self.selectedIndex = 0
    }
    
    //自定义了TabBarController 之后必须实现以下
    //thanks to http://www.cocoachina.com/bbs/read.php?tid=127618 @goodnighthsu
    override func viewWillAppear(animated: Bool) {
        self.selectedViewController.beginAppearanceTransition(true,animated:animated)
    }
    override func viewDidAppear(animated: Bool) {
        self.selectedViewController.endAppearanceTransition()
    }
    override func viewWillDisappear(animated: Bool) {
        self.selectedViewController.beginAppearanceTransition(false,animated:animated)
    }
    override func viewDidDisappear(animated: Bool) {
        self.selectedViewController.endAppearanceTransition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

    
    override func updateViewConstraints() {
        println("RootViewController === > updateViewConstraints")
        super.updateViewConstraints()
        //println("updateViewConstraints")
    }
    
    func tabBarController(tabBarController: UITabBarController!, shouldSelectViewController viewController: UIViewController!) -> Bool{
        return true
    }
    
    func tabBarController(tabBarController: UITabBarController!, didSelectViewController viewController: UIViewController!){

    }
}
