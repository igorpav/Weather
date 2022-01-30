//
//  UIImageViewExtensions.swift
//  Weather
//
//  Created by Игорь Павличенков on 29.01.2022.
//

import SDWebImage
import UIKit

extension UIImageView {

    // MARK: - Internal methods
    
    func setImage(with imageLink: String?, placeholderImage: UIImage? = UIImage(), completion: ((UIImage?) -> ())? = nil) {
        if let imageLink = imageLink {
            sd_setImage(
                with: URL(string: imageLink),
                placeholderImage: placeholderImage
            ) { image,_,_,_ in
                completion?(image)
            }
        } else {
            image = placeholderImage
        }
    }
    
}
