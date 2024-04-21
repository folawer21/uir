//
//  Extension.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit
//MARK: UITextField
extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
//MARK: UIColor
extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let r = CGFloat((hex & 0xff0000) >> 16) / 255
        let g = CGFloat((hex & 0x00ff00) >> 8) / 255
        let b = CGFloat(hex & 0x0000ff) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}


//MARK: UIView

extension UIView{
    func headerView(radious: Int){
        self.backgroundColor = UIColor(named: "blueForHeaders")
        self.layer.cornerRadius = CGFloat(radious)
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.borderWidth = 2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView{
    func blockView(radious: Int) {
        self.backgroundColor = UIColor(named: "blueForViews")
        self.layer.cornerRadius = CGFloat(radious)
        self.layer.borderWidth = 2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}


