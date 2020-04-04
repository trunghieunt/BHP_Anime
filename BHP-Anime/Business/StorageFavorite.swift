//
//  StorageFavorite.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/8/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation
class StorageFavorite: NSObject {
    
    
let userDefaults = UserDefaults.standard
    
    let STORAGE_FAVORITE = "favorite"
    let STATUS_RATE_APP = "statusrateapp"
    
    override init() {
        super.init()
    }
    
    class var sharedInstance: StorageFavorite {
        struct Static {
            static let instance: StorageFavorite = StorageFavorite()
        }
        return Static.instance
    }
    
    func saveFavorites(listFavorites: [ObFavorite]){
        let favoritesData = NSKeyedArchiver.archivedData(withRootObject: listFavorites)
        
        userDefaults.set(favoritesData, forKey: self.STORAGE_FAVORITE)
    }
    
    func loadFavorites(success :  @escaping ([ObFavorite]) -> Void, notFound:@escaping () -> Void ){
        guard let favoritesData = UserDefaults.standard.object(forKey: self.STORAGE_FAVORITE) as? NSData else {
            notFound()
            print("'places' not found in UserDefaults")
            return
        }

        guard let favoritesArray = NSKeyedUnarchiver.unarchiveObject(with: favoritesData as Data) as? [ObFavorite] else {
            print("Could not unarchive from placesData")
            return
        }

        success(favoritesArray)
    }
}
