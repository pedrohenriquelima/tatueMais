//
//  Tattooer.swift
//  tatueMais
//
//  Created by Treinamento on 19/05/18.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit
import Firebase

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
        if let photo = UIImage(named: self.photoName) {
            self.photo = photo
        } else {
            self.photo = UIImage(named: "profileblur")!
        }
        
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let instagram = value["instagram"] as? String,
            let description = value["description"] as? String
            else {
                return nil
        }
        self.name = name
        self.instagram = instagram
        self.description = description
        if let photoName = value["profilePhoto"] as? String{
            self.photoName = photoName
        } else {
            self.photoName = "profileblur"
        }
        self.photo = UIImage(named: self.photoName)!
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "instagram": instagram,
            "description": description,
            "photoName" : photoName,
            "photo" : photo
       ]
    }
}
