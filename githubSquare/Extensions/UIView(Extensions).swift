//
//  UIView(Extensions).swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

import UIKit

extension UIView {
    static var identifier: String {
        return String(describing: self.self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: self.identifier, bundle: Bundle.init(for: self.self))
    }
}
