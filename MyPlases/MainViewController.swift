//
//  MainViewController.swift
//  MyPlases
//
//  Created by Сергей Васильев on 17.07.2020.
//  Copyright © 2020 Сергей Васильев. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {


    
    var plases: Results<Place>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        plases = realm.objects(Place.self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plases.isEmpty ? 0 : plases.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let place = plases[indexPath.row]

        cell.nameLable.text = place.name
        cell.lacationLable.text = place.location
        cell.typeLable.text = place.type
        cell.imageOfPlase.image = UIImage(data: place.imageData!)

        cell.imageOfPlase.layer.cornerRadius = cell.imageOfPlase.frame.size.height / 2
        cell.imageOfPlase.clipsToBounds = true

        return cell
    }
    
 
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let place = plases[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let place = plases[indexPath.row]
            let newPlaceVS = segue.destination as! NewPlacesViewController
            newPlaceVS.currentPlace = place
        }
            
    }
    

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlacesViewController else { return }
        
        newPlaceVC.savePlace()
        tableView.reloadData()
    }
    
}
