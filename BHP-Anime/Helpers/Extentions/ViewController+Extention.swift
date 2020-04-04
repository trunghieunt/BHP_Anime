//
//  ViewController+Extention.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift


extension UIViewController {
    class func loadFromNib() -> Self {
        func loadFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return loadFromNib(self)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showToast(position: ToastPosition, message: String) {
        var style = ToastStyle.init()
        style.backgroundColor = .black
        style.messageColor = .white
        self.view.makeToast(message, duration: 3.0, position: position, style: style)
    }
    
    func showToastAtBottom(message: String) {
        var style = ToastStyle.init()
        style.backgroundColor = .black
        style.messageColor = .white
        self.view.makeToast(message, duration: 3.0, position: .bottom, style: style)
    }
    

    
    func showLoadingIndicator(){
        
        let tag = 12093
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.tag = tag
        //            indicator.style = UIActivityIndicatorView.Style.gray
        //            indicator.color =
        indicator.center = self.view.center
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        self.view?.addSubview(indicator)
        
    }
    
    func hideLoadingIndicator(){
        
        let tag = 12093
        if let indicator = self.view?.viewWithTag(tag) as? UIActivityIndicatorView { do {
            indicator.stopAnimating()
            indicator.removeFromSuperview()
            }
        }
        
    }
}
