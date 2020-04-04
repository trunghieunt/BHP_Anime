//
//  Backdrops.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Backdrops: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let height = "height"
    static let voteAverage = "vote_average"
    static let aspectRatio = "aspect_ratio"
    static let width = "width"
    static let voteCount = "vote_count"
    static let filePath = "file_path"
  }

  // MARK: Properties
  public var height: Int?
  public var voteAverage: Float?
  public var aspectRatio: Float?
  public var width: Int?
  public var voteCount: Int?
  public var filePath: String?

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
    height = json[SerializationKeys.height].int
    voteAverage = json[SerializationKeys.voteAverage].float
    aspectRatio = json[SerializationKeys.aspectRatio].float
    width = json[SerializationKeys.width].int
    voteCount = json[SerializationKeys.voteCount].int
    filePath = json[SerializationKeys.filePath].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = height { dictionary[SerializationKeys.height] = value }
    if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
    if let value = aspectRatio { dictionary[SerializationKeys.aspectRatio] = value }
    if let value = width { dictionary[SerializationKeys.width] = value }
    if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
    if let value = filePath { dictionary[SerializationKeys.filePath] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.height = aDecoder.decodeObject(forKey: SerializationKeys.height) as? Int
    self.voteAverage = aDecoder.decodeObject(forKey: SerializationKeys.voteAverage) as? Float
    self.aspectRatio = aDecoder.decodeObject(forKey: SerializationKeys.aspectRatio) as? Float
    self.width = aDecoder.decodeObject(forKey: SerializationKeys.width) as? Int
    self.voteCount = aDecoder.decodeObject(forKey: SerializationKeys.voteCount) as? Int
    self.filePath = aDecoder.decodeObject(forKey: SerializationKeys.filePath) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(height, forKey: SerializationKeys.height)
    aCoder.encode(voteAverage, forKey: SerializationKeys.voteAverage)
    aCoder.encode(aspectRatio, forKey: SerializationKeys.aspectRatio)
    aCoder.encode(width, forKey: SerializationKeys.width)
    aCoder.encode(voteCount, forKey: SerializationKeys.voteCount)
    aCoder.encode(filePath, forKey: SerializationKeys.filePath)
  }

}
