//
//  Results.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Results: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let id = "id"
    static let key = "key"
    static let iso31661 = "iso_3166_1"
    static let size = "size"
    static let iso6391 = "iso_639_1"
    static let type = "type"
    static let site = "site"
  }

  // MARK: Properties
  public var name: String?
  public var id: String?
  public var key: String?
  public var iso31661: String?
  public var size: Int?
  public var iso6391: String?
  public var type: String?
  public var site: String?

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
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].string
    key = json[SerializationKeys.key].string
    iso31661 = json[SerializationKeys.iso31661].string
    size = json[SerializationKeys.size].int
    iso6391 = json[SerializationKeys.iso6391].string
    type = json[SerializationKeys.type].string
    site = json[SerializationKeys.site].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = key { dictionary[SerializationKeys.key] = value }
    if let value = iso31661 { dictionary[SerializationKeys.iso31661] = value }
    if let value = size { dictionary[SerializationKeys.size] = value }
    if let value = iso6391 { dictionary[SerializationKeys.iso6391] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = site { dictionary[SerializationKeys.site] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.key = aDecoder.decodeObject(forKey: SerializationKeys.key) as? String
    self.iso31661 = aDecoder.decodeObject(forKey: SerializationKeys.iso31661) as? String
    self.size = aDecoder.decodeObject(forKey: SerializationKeys.size) as? Int
    self.iso6391 = aDecoder.decodeObject(forKey: SerializationKeys.iso6391) as? String
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.site = aDecoder.decodeObject(forKey: SerializationKeys.site) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(key, forKey: SerializationKeys.key)
    aCoder.encode(iso31661, forKey: SerializationKeys.iso31661)
    aCoder.encode(size, forKey: SerializationKeys.size)
    aCoder.encode(iso6391, forKey: SerializationKeys.iso6391)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(site, forKey: SerializationKeys.site)
  }

}
