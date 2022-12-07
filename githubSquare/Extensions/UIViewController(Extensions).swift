//
//  UIViewController(Extensions).swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    
    static var describing: String {
        return String.init(describing: self.self)
    }
    
}
