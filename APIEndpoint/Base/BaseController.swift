//
//  BaseController.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        logDebug("enter：\(self.className)")

        view.backgroundColor = UIColor.white
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        logDebug("deinit：\(className)")
    }

}

extension BaseController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let count = self.navigationController?.viewControllers.count else { return false }
        return count > 1 ? true:false
    }
}

