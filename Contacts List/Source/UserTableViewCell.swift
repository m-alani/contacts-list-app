//
//  UserTableViewCell.swift
//  Contacts List
//
//  Created by Marwan Alani on 2018-11-03.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var userThumbnail: UIImageView!
    
    // Properties
    var user: User? {
        didSet {
            title.text = user?.name
            subTitle.text = user?.email
            userThumbnail.image = user?.thumbnail
        }
    }
    
    // Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        subTitle.textColor = greenColor
    }
}
