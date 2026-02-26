//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 2/25/26.
//

import UIKit

class GFAvatarImageView: UIImageView {

//    let placeHolderImage = UIImage(named: "avatar-placeholder")!
    let placeHolderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        image = placeHolderImage
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
