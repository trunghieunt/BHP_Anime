//
<<<<<<< HEAD:BHP-Anime/Scences/Home/Models/Videos.swift
//  Videos.swift
//
//  Created by Nguyen Trung Hieu on 3/7/20
=======
//  Logo.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
>>>>>>> thay api tvshow:BHP-Anime/Scences/Home/Models/ModelsDetails/Logo.swift
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

<<<<<<< HEAD:BHP-Anime/Scences/Home/Models/Videos.swift
public final class Videos: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let results = "results"
  }

  // MARK: Properties
  public var results: [Results]?
=======
public final class Logo: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let aspectRatio = "aspect_ratio"
    static let path = "path"
  }

  // MARK: Properties
  public var aspectRatio: Float?
  public var path: String?
>>>>>>> thay api tvshow:BHP-Anime/Scences/Home/Models/ModelsDetails/Logo.swift

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
<<<<<<< HEAD:BHP-Anime/Scences/Home/Models/Videos.swift
    if let items = json[SerializationKeys.results].array { results = items.map { Results(json: $0) } }
=======
    aspectRatio = json[SerializationKeys.aspectRatio].float
    path = json[SerializationKeys.path].string
>>>>>>> thay api tvshow:BHP-Anime/Scences/Home/Models/ModelsDetails/Logo.swift
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
<<<<<<< HEAD:BHP-Anime/Scences/Home/Models/Videos.swift
    if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
=======
    if let value = aspectRatio { dictionary[SerializationKeys.aspectRatio] = value }
    if let value = path { dictionary[SerializationKeys.path] = value }
>>>>>>> thay api tvshow:BHP-Anime/Scences/Home/Models/ModelsDetails/Logo.swift
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
<<<<<<< HEAD:BHP-Anime/Scences/Home/Models/Videos.swift
    self.results = aDecoder.decodeObject(forKey: SerializationKeys.results) as? [Results]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(results, forKey: SerializationKeys.results)
=======
    self.aspectRatio = aDecoder.decodeObject(forKey: SerializationKeys.aspectRatio) as? Float
    self.path = aDecoder.decodeObject(forKey: SerializationKeys.path) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(aspectRatio, forKey: SerializationKeys.aspectRatio)
    aCoder.encode(path, forKey: SerializationKeys.path)
>>>>>>> thay api tvshow:BHP-Anime/Scences/Home/Models/ModelsDetails/Logo.swift
  }

}
