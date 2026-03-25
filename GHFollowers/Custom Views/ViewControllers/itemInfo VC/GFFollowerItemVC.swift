//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 3/23/26.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    func configureItems(){
        infoItemOne.set(itemInfoType: .followers, withCount: user.followers)
        infoItemTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
}
