//
//  ViewController.swift
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
    
    // MARK: ViewController Lifecycle
    
    // This will be run only once, after the ViewController has been initialiased
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }

    // MARK: Other functions
    func uiSetup() {
        view.backgroundColor = lightColor
    }
    
}

// MARK: TableView Data Source Delegate Extension
extension MainContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

// MARK: TableView Delegate Extension
extension MainContactsViewController: UITableViewDelegate {
    
}
