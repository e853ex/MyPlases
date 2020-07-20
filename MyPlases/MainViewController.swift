//
//  MainViewController.swift
//  MyPlases
//
//  Created by Сергей Васильев on 17.07.2020.
//  Copyright © 2020 Сергей Васильев. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let restaurantNames = ["Burger Heroes", "Kitchen", "Bonsai", "Дастархан",
                           "Индокитай", "X.O", "Балкан Гриль", "Sherlock Holmes",
                           "Speak Easy", "Morris Pub", "Вкусные истории", "Классик",
                           "Love & Life", "Шок", "Бочка"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLable.text = restaurantNames[indexPath.row]
        cell.imageOfPlase.image = UIImage(named: restaurantNames[indexPath.row])
        cell.imageOfPlase.layer.cornerRadius = cell.imageOfPlase.frame.size.height / 2
        cell.imageOfPlase.clipsToBounds = true

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
