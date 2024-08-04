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

// MARK: - UIViewController
extension UIViewController {
    
    
    // MARK: - showAlertDialog()
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

// MARK: - String
extension String {
    
    
    // MARK: - getDateFromString()
    func getDateFromString(dateFormate: String) -> Date? {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = dateFormate
        if let date = dateFormatterGet.date(from: self) {
            return date
        } else {
            print("There was an error decoding the string")
            return nil
        }
    }
}

// MARK: - Date
extension Date {
    
    
    // Convert UTC (or GMT) to local time
    // MARK: - toLocalTime()
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    // MARK: - getFormatedStringFromDate()
    func getFormatedStringFromDate(formate: String) -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = formate
        return dateFormatterPrint.string(from: self)
    }
}
