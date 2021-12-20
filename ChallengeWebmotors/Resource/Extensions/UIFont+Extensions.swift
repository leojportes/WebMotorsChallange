//
//  UIFont+Extensions.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 20/12/21.
//

import UIKit

public extension UIFont {
    
    static let fontDefaultGeorgia = UIFont(name: "Georgia", size: 16) ?? UIFont()
  
    static var spartanBoldFont: UIFont {
        return UIFont(name: "Spartan-Bold", size: 16) ?? fontDefaultGeorgia
    }
    
    static var spartanRegularFont: UIFont {
        return UIFont(name: "Spartan-Regular", size: 16) ?? fontDefaultGeorgia
    }

}
