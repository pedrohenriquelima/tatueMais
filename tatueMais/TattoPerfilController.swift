//
//  TattoPerfilController.swift
//  tatueMais
//
//  Created by Treinamento on 12/05/18.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit

class TattoPerfilController: UIViewController {

    @IBOutlet weak var imgTattooerPhoto: UIImageView!
    @IBOutlet weak var lblTattooerName: UILabel!
    @IBOutlet weak var lblTattooerInstagram: UILabel!
    @IBOutlet weak var txtViewDescription: UITextView!
    
    var tattooer: Tattooer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTattooerName.text = tattooer?.name
        lblTattooerInstagram.text = tattooer?.instagram
        imgTattooerPhoto.image = tattooer?.photo
        txtViewDescription.text = tattooer?.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
