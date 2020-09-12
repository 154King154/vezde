//
//  UIViewController+.swift
//  vk
//
//  Created by lazarevtill on 12.09.2020.
//  Copyright © 2020 lazarevtill. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
