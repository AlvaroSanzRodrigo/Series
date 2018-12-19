//
//  ActoresViewController.swift
//  Series
//
//  Created by Álvaro Sanz Rodrigo on 3/10/18.
//  Copyright © 2018 Álvaro Sanz Rodrigo. All rights reserved.
//

import UIKit
import SDWebImage

class ActoresViewController: UIViewController {
    
    internal var actors: [Actors] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupBarButtonsItems()
    }
    
    convenience init(actors: [Actors]){
        self.init()
        self.actors = actors
    }
    
    private func registerCells(){
        let identifier = "ActorTableViewCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: identifier)
        let emptyStatusCellNib = UINib(nibName: "EmptyStatusTableViewCell", bundle: nil)
        tableView.register(emptyStatusCellNib, forCellReuseIdentifier: "emptyStatusCell")
        
    }
    private func setupBarButtonsItems(){
        let addBarButtom = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPressed))
        navigationItem.setRightBarButton(addBarButtom, animated: false)
    }
    
    @objc private func cancelPressed(){
        dismiss(animated: true, completion: nil)
    }
    @objc private func addPressed(){
        let date = Date()
        
        print(date)
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        actors.append(Actors.init(name: dateFormatter.string(from: date), avatar: "https://api.adorable.io/avatars/400/c2cf74b5f076e3b0da47d289f81b5bd7.png"))
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ActoresViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (actors.count > 0)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteActorAtIndexPath(indexPath)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func deleteActorAtIndexPath(_ indexPath: IndexPath) {
        actors.remove(at: indexPath.row)
        if actors.count > 0 {
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }else{
        tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if actors.count == 0 {
            return 1
        } else {
        return actors.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if actors.count == 0 {
            return 136.0
        }else {
            return 55.0
        }
            }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if actors.count == 0 {
                    let emptyCell: EmptyStatusTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "emptyStatusCell", for: indexPath) as? EmptyStatusTableViewCell)!
            emptyCell.delegate = self
        return emptyCell
        }else {
            let cell: ActorTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "ActorTableViewCell", for: indexPath) as? ActorTableViewCell)!
            let actor = actors[indexPath.row]
            cell.nameLabel.text = actor.name
            cell.avatarImageView.sd_setImage(with: URL(string: actor.avatar), completed: nil)
        return cell
        }
    }
}
extension ActoresViewController: EmptyStatusTableViewCellDelegate {
    func emptyStatusCellDidPressBack(cell: EmptyStatusTableViewCell) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
