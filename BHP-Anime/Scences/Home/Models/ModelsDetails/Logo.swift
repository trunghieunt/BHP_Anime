//
//  Logo.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Logo: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let aspectRatio = "aspect_ratio"
    static let path = "path"
  }

  // MARK: Properties
  public var aspectRatio: Float?
  public var path: String?

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
    aspectRatio = json[SerializationKeys.aspectRatio].float
    path = json[SerializationKeys.path].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = aspectRatio { dictionary[SerializationKeys.aspectRatio] = value }
    if let value = path { dictionary[SerializationKeys.path] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.aspectRatio = aDecoder.decodeObject(forKey: SerializationKeys.aspectRatio) as? Float
    self.path = aDecoder.decodeObject(forKey: SerializationKeys.path) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(aspectRatio, forKey: SerializationKeys.aspectRatio)
    aCoder.encode(path, forKey: SerializationKeys.path)
  }

}
