//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Нуридин Сафаралиев on 11/5/25.
//

import UIKit

class SearchVC: UIViewController {


    let logoimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "gh-logo")!
        return imageView
    }()
    
    let usernameTextField: GFTextField = {
        let textField = GFTextField()
        return textField
    }()

    let callToActionButton: GFButton = {
        let button = GFButton(backgroundColor: .systemGreen, title: "Search")
        button.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        return button
    }()
    
    var isUserNameEntered:Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        usernameTextField.delegate = self
        
        createDismissKeyboardTapGesture()
        configureUI()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func pushFollowerListVC(){
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who we look for", buttonTitle: "OK")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.hidesBottomBarWhenPushed = true
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: false)
    }
    

    
    
    func configureUI() {
        
        view.addSubview(logoimageView)
        view.addSubview(usernameTextField)
        view.addSubview(callToActionButton)
        
        
        NSLayoutConstraint.activate([
            
            logoimageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoimageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoimageView.widthAnchor.constraint(equalToConstant: 200),
            logoimageView.heightAnchor.constraint(equalToConstant: 200),
            
            usernameTextField.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        print("didTapReturn")
        return true
    }
}
