//
//  MyExtensions.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation
import UIKit


// MARK: - UIView
extension UIView {
    
    @IBInspectable var myCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}

extension UIViewController {
    
    func showAlertDialog(title: String, message: String, isTwoButtonDialog: Bool, callback: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if isTwoButtonDialog {
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
                alert.dismiss(animated: true)
            }
            cancel.setValue(UIColor.systemRed, forKey: "titleTextColor")
            alert.addAction(cancel)
        }
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            alert.dismiss(animated: true)
            callback()
        }
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
}
