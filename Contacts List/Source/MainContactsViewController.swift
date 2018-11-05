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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchUsers()
    }

    // MARK: Other functions
    
    func fetchUsers() {
        let completionHandler: FetchUsersCompletionHandler = { [weak self] (fetchedUsers) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.activityIndicator.stopAnimating()
                strongSelf.activityIndicator.isHidden = true
                strongSelf.tableView.isHidden = false
                
                strongSelf.users = fetchedUsers
                strongSelf.tableView.reloadData()
            }
        }
        
        tableView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        Network.fetchUsers(completionHandler)
    }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: ShowUserDetailsSegue, sender: nil)
    }
}
