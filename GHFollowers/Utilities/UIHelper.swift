//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 2/27/26.
//

import UIKit


struct UIHelper {
    static func createCollectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout{
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minItemSpacing: CGFloat = 10
        
        let availableWidth = width - (padding*2) - (minItemSpacing*2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
}
