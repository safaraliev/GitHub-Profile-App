//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 3/20/26.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems(){
        infoItemOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        infoItemTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubButton(user: user)
    }
    
}
