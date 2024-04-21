//
//  BlockUIView.swift
//  uir
//
//  Created by Александр  Сухинин on 21.04.2024.
//

import UIKit

final class BlockView{
    let view = UIView()
    init(radious: Int){
        self.view.backgroundColor = UIColor(named: "greyForView")
        self.view.layer.cornerRadius = CGFloat(radious)
        self.view.layer.borderWidth = 2
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
