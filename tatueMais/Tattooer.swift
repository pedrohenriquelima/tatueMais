//
//  Tattooer.swift
//  tatueMais
//
//  Created by Treinamento on 19/05/18.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit

class Tattooer {
    var name: String
    var instagram: String
    var photoName: String
    var description: String
    var photo: UIImage
    
    init(name: String, instagram: String, description: String) {
        self.name = name
        self.instagram = instagram
        self.description = description
        self.photoName = "profileblur"
        self.photo = UIImage(named: "profileblur")!
    }
    init(name: String, instagram: String, description: String, photoName: String) {
        self.name = name
        self.instagram = instagram
        self.description = description
        self.photoName = photoName
        self.photo = UIImage(named: self.photoName)!
    }
}
