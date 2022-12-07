//
//  UIStoryboard(Extensions).swift
//  githubSquare
//
//  Created by admin on 17.09.2022.
//

import UIKit

extension UIStoryboard {
    enum storyboards: String {
        case main = "Main"

        func initiate(with bundle: Bundle = .main) -> UIStoryboard {
            return UIStoryboard.init(name: self.rawValue, bundle: bundle)
        }
    }
    func initiateViewControllerFromType<T: UIViewController>() -> T {
        guard let vc = self.instantiateViewController(withIdentifier: T.describing) as? T else {
            fatalError("Some error with initiating view controller with specified type, check if cpecified right storyboard id for it!")
        }
        return vc
    }
}
