//
//  UIImage+Network.swift
//  Contacts List
//
//  Created by Alani, Marwan on 2018-11-05.
//  Copyright © 2018 Marwan Alani. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadImageFrom(url urlString: String, forCell cell: UITableViewCell) {
        guard let url = URL(string: urlString) else { return }
        //contentMode = .scaleAspectFill
        let networkCall = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data,
                error == nil
                else { return }
            let image = UIImage(data: data) ?? UIImage(named: "user_placeholder")
            DispatchQueue.main.async() { () -> Void in
                self?.image = image
                cell.setNeedsLayout()
            }
        }
        networkCall.resume()
    }
}
