//
//  NewPlacesViewController.swift
//  MyPlases
//
//  Created by Сергей Васильев on 20.07.2020.
//  Copyright © 2020 Сергей Васильев. All rights reserved.
//

import UIKit

class NewPlacesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
    
}


// MARK: Text field delegate

extension NewPlacesViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
