//
//  Images.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Images: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let posters = "posters"
    static let backdrops = "backdrops"
  }

  // MARK: Properties
  public var posters: [Posters]?
  public var backdrops: [Backdrops]?

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
    if let items = json[SerializationKeys.posters].array { posters = items.map { Posters(json: $0) } }
    if let items = json[SerializationKeys.backdrops].array { backdrops = items.map { Backdrops(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = posters { dictionary[SerializationKeys.posters] = value.map { $0.dictionaryRepresentation() } }
    if let value = backdrops { dictionary[SerializationKeys.backdrops] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.posters = aDecoder.decodeObject(forKey: SerializationKeys.posters) as? [Posters]
    self.backdrops = aDecoder.decodeObject(forKey: SerializationKeys.backdrops) as? [Backdrops]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(posters, forKey: SerializationKeys.posters)
    aCoder.encode(backdrops, forKey: SerializationKeys.backdrops)
  }

}
