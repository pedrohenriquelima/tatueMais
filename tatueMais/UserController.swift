//
//  UserController.swift
//  tatueMais
//
//  Created by Treinamento on 12/05/18.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit

class UserController: UIViewController {

    @IBOutlet weak var imgUserPhoto: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imgUserPhoto.image = UIImage(named: "userPhoto")
        lblUserName.text = "Pedro Henrique Lima"
        lblUserDescription.text = "Felis lacinia nec ad nisi dapibus senectus suspendisse vitae vel lectus sit suscipit, cras augue ultricies interdum senectus etiam pulvinar molestie mauris donec. ultrices ut pulvinar senectus aenean taciti ligula fringilla praesent potenti curae, sollicitudin pellentesque diam habitant augue ac amet faucibus ad, nunc rutrum urna leo risus feugiat sem auctor interdum. sollicitudin malesuada platea lorem pellentesque sem pretium litora augue sollicitudin, suscipit nisi tincidunt inceptos eleifend posuere facilisis velit aliquam, taciti eros facilisis feugiat eros leo nunc enim. duis nisi vel amet convallis aptent potenti, mi at suscipit consequat cubilia. "
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
