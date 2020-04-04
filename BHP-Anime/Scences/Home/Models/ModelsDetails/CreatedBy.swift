//
//  CreatedBy.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CreatedBy: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let gender = "gender"
    static let name = "name"
    static let creditId = "credit_id"
    static let id = "id"
    static let profilePath = "profile_path"
  }

  // MARK: Properties
  public var gender: Int?
  public var name: String?
  public var creditId: String?
  public var profilePath: String?
  public var id: Int?

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
    gender = json[SerializationKeys.gender].int
    name = json[SerializationKeys.name].string
    creditId = json[SerializationKeys.creditId].string
    creditId = json[SerializationKeys.profilePath].string
    id = json[SerializationKeys.id].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = gender { dictionary[SerializationKeys.gender] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = creditId { dictionary[SerializationKeys.creditId] = value }
    if let value = profilePath { dictionary[SerializationKeys.profilePath] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.gender = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.creditId = aDecoder.decodeObject(forKey: SerializationKeys.creditId) as? String
    self.profilePath = aDecoder.decodeObject(forKey: SerializationKeys.profilePath) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(gender, forKey: SerializationKeys.gender)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(creditId, forKey: SerializationKeys.creditId)
    aCoder.encode(profilePath, forKey: SerializationKeys.profilePath)
    aCoder.encode(id, forKey: SerializationKeys.id)
  }

}
