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
            guard let unwrapperUser = user else { return }
            title.text = unwrapperUser.name
            subTitle.text = unwrapperUser.email
            userThumbnail.downloadImageFrom(url: unwrapperUser.thumbnailUrl, forCell: self)
        }
    }
    
    // Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        subTitle.textColor = greenColor
    }
}
