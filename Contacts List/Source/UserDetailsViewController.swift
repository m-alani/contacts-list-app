//
//  UserDetailsViewController.swift
//  Contacts List
//
//  Created by Alani, Marwan on 2018-11-05.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    // Outlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // Properties
    var user: User?
    
    // Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setColorsUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let unwrappedUser = user else {
            self.dismiss(animated: true)
            return
        }
        
        userImageView.downloadImageFrom(url: unwrappedUser.pictureUrl)
        setTextUp()
    }
    
    // Other Functions
    func setColorsUp() {
        userNameLabel.textColor = darkColor
        userEmailLabel.textColor = greyColor
        userPhoneLabel.textColor = greyColor
        navigationItem.leftBarButtonItem?.tintColor = greenColor
        backButton.tintColor = greenColor
    }
    
    func setTextUp() {
        guard let unwrappedUser = user else { return }
        userNameLabel.text = unwrappedUser.name
        userEmailLabel.text = unwrappedUser.email
        userPhoneLabel.text = unwrappedUser.phone
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
