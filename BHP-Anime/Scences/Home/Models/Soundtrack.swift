//
//  Soundtrack.swift
//
//  Created by Nguyen Trung Hieu on 4/1/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Soundtrack: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let collectionName = "collectionName"
    static let collectionViewUrl = "collectionViewUrl"
    static let artworkUrl100 = "artworkUrl100"
    static let artistName = "artistName"
  }

  // MARK: Properties
  public var collectionName: String?
  public var collectionViewUrl: String?
  public var artworkUrl100: String?
  public var artistName: String?

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
    collectionName = json[SerializationKeys.collectionName].string
    collectionViewUrl = json[SerializationKeys.collectionViewUrl].string
    artworkUrl100 = json[SerializationKeys.artworkUrl100].string
    artistName = json[SerializationKeys.artistName].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = collectionName { dictionary[SerializationKeys.collectionName] = value }
    if let value = collectionViewUrl { dictionary[SerializationKeys.collectionViewUrl] = value }
    if let value = artworkUrl100 { dictionary[SerializationKeys.artworkUrl100] = value }
    if let value = artistName { dictionary[SerializationKeys.artistName] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.collectionName = aDecoder.decodeObject(forKey: SerializationKeys.collectionName) as? String
    self.collectionViewUrl = aDecoder.decodeObject(forKey: SerializationKeys.collectionViewUrl) as? String
    self.artworkUrl100 = aDecoder.decodeObject(forKey: SerializationKeys.artworkUrl100) as? String
    self.artistName = aDecoder.decodeObject(forKey: SerializationKeys.artistName) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(collectionName, forKey: SerializationKeys.collectionName)
    aCoder.encode(collectionViewUrl, forKey: SerializationKeys.collectionViewUrl)
    aCoder.encode(artworkUrl100, forKey: SerializationKeys.artworkUrl100)
    aCoder.encode(artistName, forKey: SerializationKeys.artistName)
  }

}
