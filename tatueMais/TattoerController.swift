//
//  TattoerController.swift
//  tatueMais
//
//  Created by Treinamento on 12/05/18.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TattoerController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var fireBaseReference: DatabaseReference?
    var fireBaseDataHandle: DatabaseHandle?
    
    var tattooerList = [Tattooer]()
    
    @IBOutlet weak var tableViewTattooerList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let tattooersRef = Database.database().reference(withPath: "tattooers")

        tattooersRef.observe(.value, with: { snapshot in
            var newTattooers: [Tattooer] = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let tattooer = Tattooer(snapshot: snapshot) {
                    newTattooers.append(tattooer)
                }
            }
            self.tattooerList = newTattooers
            self.tableViewTattooerList.reloadData()
        })
        tableViewTattooerList.delegate = self
        tableViewTattooerList.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tattooerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewTattooerList.dequeueReusableCell(withIdentifier: "tattooerCell") as! TattooerTableViewCell
        cell.tattooerCell.layer.cornerRadius = cell.tattooerCell.frame.height / 2
        cell.tattoerCellName.text = tattooerList[indexPath.row].name
        cell.tattooerCellImage.image = UIImage(named: tattooerList[indexPath.row].photoName)
        cell.tattooerCellImage.clipsToBounds = true
        cell.tattooerCellImage.layer.cornerRadius = cell.tattooerCellImage.frame.height / 2
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TattooerListToTattooerProfile", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationView = segue.destination as? TattoPerfilController {
            destinationView.tattooer = tattooerList[(tableViewTattooerList.indexPathForSelectedRow?.row)!]
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
