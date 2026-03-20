//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 3/20/26.
//

import UIKit

class GFItemInfoVC: UIViewController {
        
    let stackView = UIStackView()
    let infoItemOne = GFItemInfoView()
    let infoItemTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureStackView()
        layoutUI()
    }
    
    private func configureBackgroundView(){
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStackView(){
        stackView.axis =  .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(infoItemOne)
        stackView.addArrangedSubview(infoItemTwo)
    }
    
    private func layoutUI(){
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
