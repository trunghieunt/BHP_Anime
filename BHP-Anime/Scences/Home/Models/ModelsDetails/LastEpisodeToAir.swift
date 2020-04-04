//
//  LastEpisodeToAir.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class LastEpisodeToAir: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let overview = "overview"
    static let airDate = "air_date"
    static let voteAverage = "vote_average"
    static let name = "name"
    static let id = "id"
    static let productionCode = "production_code"
    static let seasonNumber = "season_number"
    static let showId = "show_id"
    static let episodeNumber = "episode_number"
    static let stillPath = "still_path"
    static let voteCount = "vote_count"
  }

  // MARK: Properties
  public var overview: String?
  public var airDate: String?
  public var voteAverage: Int?
  public var name: String?
  public var id: Int?
  public var productionCode: String?
  public var seasonNumber: Int?
  public var showId: Int?
  public var episodeNumber: Int?
  public var stillPath: String?
  public var voteCount: Int?

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
    overview = json[SerializationKeys.overview].string
    airDate = json[SerializationKeys.airDate].string
    voteAverage = json[SerializationKeys.voteAverage].int
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    productionCode = json[SerializationKeys.productionCode].string
    seasonNumber = json[SerializationKeys.seasonNumber].int
    showId = json[SerializationKeys.showId].int
    episodeNumber = json[SerializationKeys.episodeNumber].int
    stillPath = json[SerializationKeys.stillPath].string
    voteCount = json[SerializationKeys.voteCount].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = overview { dictionary[SerializationKeys.overview] = value }
    if let value = airDate { dictionary[SerializationKeys.airDate] = value }
    if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = productionCode { dictionary[SerializationKeys.productionCode] = value }
    if let value = seasonNumber { dictionary[SerializationKeys.seasonNumber] = value }
    if let value = showId { dictionary[SerializationKeys.showId] = value }
    if let value = episodeNumber { dictionary[SerializationKeys.episodeNumber] = value }
    if let value = stillPath { dictionary[SerializationKeys.stillPath] = value }
    if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.overview = aDecoder.decodeObject(forKey: SerializationKeys.overview) as? String
    self.airDate = aDecoder.decodeObject(forKey: SerializationKeys.airDate) as? String
    self.voteAverage = aDecoder.decodeObject(forKey: SerializationKeys.voteAverage) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.productionCode = aDecoder.decodeObject(forKey: SerializationKeys.productionCode) as? String
    self.seasonNumber = aDecoder.decodeObject(forKey: SerializationKeys.seasonNumber) as? Int
    self.showId = aDecoder.decodeObject(forKey: SerializationKeys.showId) as? Int
    self.episodeNumber = aDecoder.decodeObject(forKey: SerializationKeys.episodeNumber) as? Int
    self.stillPath = aDecoder.decodeObject(forKey: SerializationKeys.stillPath) as? String
    self.voteCount = aDecoder.decodeObject(forKey: SerializationKeys.voteCount) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(overview, forKey: SerializationKeys.overview)
    aCoder.encode(airDate, forKey: SerializationKeys.airDate)
    aCoder.encode(voteAverage, forKey: SerializationKeys.voteAverage)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(productionCode, forKey: SerializationKeys.productionCode)
    aCoder.encode(seasonNumber, forKey: SerializationKeys.seasonNumber)
    aCoder.encode(showId, forKey: SerializationKeys.showId)
    aCoder.encode(episodeNumber, forKey: SerializationKeys.episodeNumber)
    aCoder.encode(stillPath, forKey: SerializationKeys.stillPath)
    aCoder.encode(voteCount, forKey: SerializationKeys.voteCount)
  }

}
