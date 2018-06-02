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
    let searchController = UISearchController(searchResultsController: nil)
    
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
        
//        let tattooer1 = Tattooer(name: "Tattooer1", instagram: "@tattooer1", description: "Lorem ipsum interdum fringilla sodales quam elit dictum suscipit sociosqu curae quis, curabitur ut nostra turpis suscipit quam sit hac ut. ultricies tempor nisi per sollicitudin arcu nisl habitasse curae phasellus, cubilia turpis vivamus ultricies donec suscipit facilisis. ultricies suspendisse fringilla vulputate mauris aenean justo eleifend orci praesent, litora eros purus sociosqu maecenas molestie mi. tellus quis cursus felis sollicitudin hendrerit et habitasse, scelerisque ad tempus semper nibh etiam consequat sem, interdum ut ad consequat porttitor aliquam. lacinia lacus amet ullamcorper adipiscing amet praesent litora tristique, nibh imperdiet aliquet fringilla interdum fames aenean.", photoName: "022-man-4")
//        let tattooer2 = Tattooer(name: "Tattooer2", instagram: "@tattooer2", description: "Tincidunt mollis fames nisi metus consectetur vivamus sapien enim mollis, porttitor conubia molestie ornare viverra tempor vulputate himenaeos magna, lobortis donec fames aliquam elementum semper ultrices velit. inceptos nec iaculis lacinia nibh diam nec imperdiet fringilla orci eu, aliquam conubia pretium accumsan conubia eu auctor ultrices ipsum fermentum at, malesuada aliquet magna convallis augue curabitur semper quam eget. massa dictumst metus sem sed vulputate odio nisl dictum facilisis curabitur, gravida massa et convallis malesuada laoreet feugiat ante sociosqu non, fringilla quisque vel volutpat sem litora facilisis vivamus libero. facilisis aenean diam sociosqu sem convallis porttitor himenaeos porttitor maecenas, torquent orci pulvinar fames sem ad accumsan orci volutpat massa, consequat fermentum curabitur sem blandit rhoncus nostra justo.", photoName: "021-man-5")
//        let tattooer3 = Tattooer(name: "Tattooer3", instagram: "@tattooer3", description: "Eget arcu justo metus morbi tincidunt curae sem vestibulum volutpat senectus duis rutrum auctor, mauris pharetra mattis cubilia elit dolor quisque metus malesuada et litora est. mauris platea erat lacus ante mollis velit, quam tincidunt volutpat malesuada duis malesuada, auctor volutpat ipsum egestas pellentesque. placerat sodales nulla sodales nullam etiam adipiscing tellus imperdiet, vulputate rhoncus rutrum faucibus libero tortor urna ad odio, gravida vivamus eget lobortis tempus elementum ad. ultrices id iaculis elementum purus non lacinia dui imperdiet lobortis luctus lobortis, id dictum ad nunc urna semper per sociosqu leo interdum, sociosqu lacus nisi sit odio tristique torquent sem a tellus.", photoName: "020-man-6")
//        let tattooer4 = Tattooer(name: "Tattooer4", instagram: "@tattooer3", description: "Himenaeos convallis ante mauris est sed vehicula enim varius, ultricies aliquam lorem sed aliquam eget tempor curae nullam, tellus justo nibh iaculis amet ante consectetur. sagittis tincidunt pharetra enim sociosqu torquent proin risus aptent augue, himenaeos fermentum vestibulum maecenas quis iaculis tempor. pharetra venenatis congue dolor bibendum habitasse risus hac viverra ultricies diam, vel himenaeos ad curae fusce varius enim conubia cubilia. viverra curae adipiscing pellentesque suscipit id ad fusce, erat venenatis eu facilisis varius euismod, potenti praesent feugiat rhoncus fringilla nullam. lectus odio aenean auctor accumsan arcu vehicula class integer hac, convallis leo at morbi elit imperdiet lacinia.")
//        tattooerList.append(contentsOf:[tattooer1, tattooer2, tattooer3, tattooer4])
        
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
