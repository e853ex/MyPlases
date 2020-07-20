//
//  MainViewController.swift
//  MyPlases
//
//  Created by Сергей Васильев on 17.07.2020.
//  Copyright © 2020 Сергей Васильев. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {


    
    let plases = Place.getPlaces()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        cell.nameLable.text = plases[indexPath.row].name
        cell.lacationLable.text = plases[indexPath.row].location
        cell.typeLable.text = plases[indexPath.row].type
        cell.imageOfPlase.image = UIImage(named: plases[indexPath.row].image)
        
        cell.imageOfPlase.layer.cornerRadius = cell.imageOfPlase.frame.size.height / 2
        cell.imageOfPlase.clipsToBounds = true

        return cell
    }
    
 
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}
    
}
