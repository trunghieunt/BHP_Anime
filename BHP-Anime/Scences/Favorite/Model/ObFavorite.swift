//
//  ObFavorite.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/8/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation

class ObFavorite: NSObject, NSCoding {
    var id : String?
    var posterPath : String?
    
    init(id: String,posterPath: String) {
        self.id = id
        self.posterPath = posterPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? String ?? ""
        self.posterPath = aDecoder.decodeObject(forKey: "posterPath") as? String ?? ""
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(posterPath, forKey: "posterPath")
    }
}
