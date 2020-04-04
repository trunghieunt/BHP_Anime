//
//  EpisodeItems.swift
//
//  Created by Nguyen Trung Hieu on 4/3/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class EpisodeItems: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let airDate = "air_date"
    static let name = "name"
    static let crew = "crew"
    static let showId = "show_id"
    static let seasonNumber = "season_number"
    static let voteCount = "vote_count"
    static let overview = "overview"
    static let guestStars = "guest_stars"
    static let voteAverage = "vote_average"
    static let id = "id"
    static let episodeNumber = "episode_number"
    static let stillPath = "still_path"
    static let productionCode = "production_code"
  }

  // MARK: Properties
  public var airDate: String?
  public var name: String?
  public var crew: [Any]?
  public var showId: Int?
  public var seasonNumber: Int?
  public var voteCount: Int?
  public var overview: String?
  public var guestStars: [Any]?
  public var voteAverage: Float?
  public var id: Int?
  public var episodeNumber: Int?
  public var stillPath: String?
  public var productionCode: String?

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
    airDate = json[SerializationKeys.airDate].string
    name = json[SerializationKeys.name].string
    if let items = json[SerializationKeys.crew].array { crew = items.map { $0.object} }
    showId = json[SerializationKeys.showId].int
    seasonNumber = json[SerializationKeys.seasonNumber].int
    voteCount = json[SerializationKeys.voteCount].int
    overview = json[SerializationKeys.overview].string
    if let items = json[SerializationKeys.guestStars].array { guestStars = items.map { $0.object} }
    voteAverage = json[SerializationKeys.voteAverage].float
    id = json[SerializationKeys.id].int
    episodeNumber = json[SerializationKeys.episodeNumber].int
    stillPath = json[SerializationKeys.stillPath].string
    productionCode = json[SerializationKeys.productionCode].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = airDate { dictionary[SerializationKeys.airDate] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = crew { dictionary[SerializationKeys.crew] = value }
    if let value = showId { dictionary[SerializationKeys.showId] = value }
    if let value = seasonNumber { dictionary[SerializationKeys.seasonNumber] = value }
    if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
    if let value = overview { dictionary[SerializationKeys.overview] = value }
    if let value = guestStars { dictionary[SerializationKeys.guestStars] = value }
    if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = episodeNumber { dictionary[SerializationKeys.episodeNumber] = value }
    if let value = stillPath { dictionary[SerializationKeys.stillPath] = value }
    if let value = productionCode { dictionary[SerializationKeys.productionCode] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.airDate = aDecoder.decodeObject(forKey: SerializationKeys.airDate) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.crew = aDecoder.decodeObject(forKey: SerializationKeys.crew) as? [Any]
    self.showId = aDecoder.decodeObject(forKey: SerializationKeys.showId) as? Int
    self.seasonNumber = aDecoder.decodeObject(forKey: SerializationKeys.seasonNumber) as? Int
    self.voteCount = aDecoder.decodeObject(forKey: SerializationKeys.voteCount) as? Int
    self.overview = aDecoder.decodeObject(forKey: SerializationKeys.overview) as? String
    self.guestStars = aDecoder.decodeObject(forKey: SerializationKeys.guestStars) as? [Any]
    self.voteAverage = aDecoder.decodeObject(forKey: SerializationKeys.voteAverage) as? Float
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.episodeNumber = aDecoder.decodeObject(forKey: SerializationKeys.episodeNumber) as? Int
    self.stillPath = aDecoder.decodeObject(forKey: SerializationKeys.stillPath) as? String
    self.productionCode = aDecoder.decodeObject(forKey: SerializationKeys.productionCode) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(airDate, forKey: SerializationKeys.airDate)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(crew, forKey: SerializationKeys.crew)
    aCoder.encode(showId, forKey: SerializationKeys.showId)
    aCoder.encode(seasonNumber, forKey: SerializationKeys.seasonNumber)
    aCoder.encode(voteCount, forKey: SerializationKeys.voteCount)
    aCoder.encode(overview, forKey: SerializationKeys.overview)
    aCoder.encode(guestStars, forKey: SerializationKeys.guestStars)
    aCoder.encode(voteAverage, forKey: SerializationKeys.voteAverage)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(episodeNumber, forKey: SerializationKeys.episodeNumber)
    aCoder.encode(stillPath, forKey: SerializationKeys.stillPath)
    aCoder.encode(productionCode, forKey: SerializationKeys.productionCode)
  }

}
