//
//  CustomTableViewCell.swift
//  MyPlases
//
//  Created by Сергей Васильев on 20.07.2020.
//  Copyright © 2020 Сергей Васильев. All rights reserved.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfPlase: UIImageView! {
        didSet {
            imageOfPlase.layer.cornerRadius = imageOfPlase.frame.size.height / 2
            imageOfPlase.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var lacationLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet weak var cosmosView: CosmosView! {
        didSet {
            cosmosView.settings.updateOnTouch = false
        }
    }
    
}
