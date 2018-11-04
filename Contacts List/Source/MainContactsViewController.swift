//
//  MainContactsViewController.swift
//  Contacts List
//
//  Created by Marwan Alani on 2018-11-03.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

import UIKit

class MainContactsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    var users = [User]()
    
    // MARK: ViewController Lifecycle
    
    // This will be run only once, after the ViewController has been initialiased
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users.append(User(name: "John Doe", email: "john@doe.com", phone: "+1-647-123-456", thumbnail: UIImage(named: "user_placeholder"), picture: UIImage(named: "user_placeholder")))
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = lightColor
        
    }

    // MARK: Other functions
    
}

// MARK: TableView Data Source Delegate Extension
extension MainContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: UserCellIdentifier) as? UserTableViewCell else { return UITableViewCell() }
        userCell.user = users[indexPath.row]
        return userCell
    }
}

// MARK: TableView Delegate Extension
extension MainContactsViewController: UITableViewDelegate {
    
}
