//
//  ImageOrderCell.swift
//  uir
//
//  Created by Александр  Сухинин on 25.04.2024.
//

import UIKit

final class ImageOrderCell: UITableViewCell{
    var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
//        imageView.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        return imageView
    }()
    
    func configCell(imageName image: String){
        print(image)
        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        cellImageView.image = UIImage(named: image)
        layer.borderWidth = 0.5
        layer.cornerRadius = 10
        contentView.addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            cellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellImageView.image = nil
       }

    
}
