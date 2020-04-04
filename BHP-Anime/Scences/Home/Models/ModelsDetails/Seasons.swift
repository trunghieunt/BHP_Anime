//
//  Seasons.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Seasons: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let posterPath = "poster_path"
    static let overview = "overview"
    static let airDate = "air_date"
    static let name = "name"
    static let id = "id"
    static let episodeCount = "episode_count"
    static let seasonNumber = "season_number"
  }

  // MARK: Properties
  public var posterPath: String?
  public var overview: String?
  public var airDate: String?
  public var name: String?
  public var id: Int?
  public var episodeCount: Int?
  public var seasonNumber: Int?

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
    posterPath = json[SerializationKeys.posterPath].string
    overview = json[SerializationKeys.overview].string
    airDate = json[SerializationKeys.airDate].string
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    episodeCount = json[SerializationKeys.episodeCount].int
    seasonNumber = json[SerializationKeys.seasonNumber].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = posterPath { dictionary[SerializationKeys.posterPath] = value }
    if let value = overview { dictionary[SerializationKeys.overview] = value }
    if let value = airDate { dictionary[SerializationKeys.airDate] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = episodeCount { dictionary[SerializationKeys.episodeCount] = value }
    if let value = seasonNumber { dictionary[SerializationKeys.seasonNumber] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.posterPath = aDecoder.decodeObject(forKey: SerializationKeys.posterPath) as? String
    self.overview = aDecoder.decodeObject(forKey: SerializationKeys.overview) as? String
    self.airDate = aDecoder.decodeObject(forKey: SerializationKeys.airDate) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.episodeCount = aDecoder.decodeObject(forKey: SerializationKeys.episodeCount) as? Int
    self.seasonNumber = aDecoder.decodeObject(forKey: SerializationKeys.seasonNumber) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(posterPath, forKey: SerializationKeys.posterPath)
    aCoder.encode(overview, forKey: SerializationKeys.overview)
    aCoder.encode(airDate, forKey: SerializationKeys.airDate)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(episodeCount, forKey: SerializationKeys.episodeCount)
    aCoder.encode(seasonNumber, forKey: SerializationKeys.seasonNumber)
  }

}
