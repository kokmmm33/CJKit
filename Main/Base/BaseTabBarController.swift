//
//  BaseTabBarController.swift
//  XFCashier
//
//  Created by 蔡杰 on 2019/3/5.
//  Copyright © 2019 鲜丰水果股份有限公司. All rights reserved.
//

import UIKit

// MARK:- superFunction
class BaseTabBarController: UITabBarController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.delegate = self;
        setupUI()
		
    }
}

// MARK:- setupUI
extension BaseTabBarController {
    fileprivate func setupUI() {
        setupChildViewControllers()
    }
	
	fileprivate func setupChildViewControllers() {
		let myTabbar = MainTabbar(frame: tabBar.frame)
		setValue(myTabbar, forKeyPath: "tabBar")
		
		let homeVC = XFHomeViewController()
		let orderVC = XFOrderViewController()
		let createOrderVC = XFCreateOrderController()
		let customerVC = XFCustomerViewController()
		let mineVC = UIStoryboard(name: "XFMine", bundle: nil).instantiateViewController(withIdentifier: "XFMineViewController")
		let titles = ["首页", "订单", " ", "客户", "我的"]
		let nomalImgs = ["首页", "订单", " ", "客户", "我的"]
		let selImgs = ["首页-选中", "订单-选中", " ", "客户-选中", "我的-选中"]
		let controllers = [homeVC, orderVC, createOrderVC, customerVC, mineVC]
		for i in 0...4 {
			setupSingleController(controller: controllers[i], nomalImage: nomalImgs[i], selectedImage: selImgs[i], title: titles[i])
		}
	}
	
	fileprivate func setupSingleController(controller : UIViewController, nomalImage : String?, selectedImage : String?, title : String?) {
		controller.tabBarItem.title = title
		if let nomalImgName = nomalImage {
			controller.tabBarItem.image = UIImage(named: nomalImgName)
		}
		if let selectedImgName = selectedImage {
			controller.tabBarItem.selectedImage = UIImage(named: selectedImgName)
		}
		let nav = BaseNavigationController(rootViewController: controller)
		addChild(nav);
	}
}

// MARK:- UITabBarControllerDelegate
extension BaseTabBarController: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		if tabBarController.selectedIndex == 2 {
		}
	}
	
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		let navController = viewController as! UINavigationController
		if navController.viewControllers[0].isKind(of: XFCreateOrderController.self) {
//			let createOrderController = XFCreateOrderController()
//			let createOrderNavController = UINavigationController(rootViewController: createOrderController)
//			createOrderController.modalPresentationStyle = .overFullScreen
//			UIApplication.shared.keyWindow?.rootViewController?.present(createOrderNavController, animated: false, completion: nil)
			return false
		}
		return true
	}
}

