//
//  Popular.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Popular: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let posterPath = "poster_path"
    static let originCountry = "origin_country"
    static let backdropPath = "backdrop_path"
    static let name = "name"
    static let genreIds = "genre_ids"
    static let firstAirDate = "first_air_date"
    static let originalName = "original_name"
    static let voteCount = "vote_count"
    static let overview = "overview"
    static let popularity = "popularity"
    static let voteAverage = "vote_average"
    static let id = "id"
    static let originalLanguage = "original_language"
  }

  // MARK: Properties
  public var posterPath: String?
  public var originCountry: [String]?
  public var backdropPath: String?
  public var name: String?
  public var genreIds: [Int]?
  public var firstAirDate: String?
  public var originalName: String?
  public var voteCount: Int?
  public var overview: String?
  public var popularity: Float?
  public var voteAverage: Float?
  public var id: Int?
  public var originalLanguage: String?

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
    if let items = json[SerializationKeys.originCountry].array { originCountry = items.map { $0.stringValue } }
    backdropPath = json[SerializationKeys.backdropPath].string
    name = json[SerializationKeys.name].string
    if let items = json[SerializationKeys.genreIds].array { genreIds = items.map { $0.intValue } }
    firstAirDate = json[SerializationKeys.firstAirDate].string
    originalName = json[SerializationKeys.originalName].string
    voteCount = json[SerializationKeys.voteCount].int
    overview = json[SerializationKeys.overview].string
    popularity = json[SerializationKeys.popularity].float
    voteAverage = json[SerializationKeys.voteAverage].float
    id = json[SerializationKeys.id].int
    originalLanguage = json[SerializationKeys.originalLanguage].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = posterPath { dictionary[SerializationKeys.posterPath] = value }
    if let value = originCountry { dictionary[SerializationKeys.originCountry] = value }
    if let value = backdropPath { dictionary[SerializationKeys.backdropPath] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = genreIds { dictionary[SerializationKeys.genreIds] = value }
    if let value = firstAirDate { dictionary[SerializationKeys.firstAirDate] = value }
    if let value = originalName { dictionary[SerializationKeys.originalName] = value }
    if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
    if let value = overview { dictionary[SerializationKeys.overview] = value }
    if let value = popularity { dictionary[SerializationKeys.popularity] = value }
    if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = originalLanguage { dictionary[SerializationKeys.originalLanguage] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.posterPath = aDecoder.decodeObject(forKey: SerializationKeys.posterPath) as? String
    self.originCountry = aDecoder.decodeObject(forKey: SerializationKeys.originCountry) as? [String]
    self.backdropPath = aDecoder.decodeObject(forKey: SerializationKeys.backdropPath) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.genreIds = aDecoder.decodeObject(forKey: SerializationKeys.genreIds) as? [Int]
    self.firstAirDate = aDecoder.decodeObject(forKey: SerializationKeys.firstAirDate) as? String
    self.originalName = aDecoder.decodeObject(forKey: SerializationKeys.originalName) as? String
    self.voteCount = aDecoder.decodeObject(forKey: SerializationKeys.voteCount) as? Int
    self.overview = aDecoder.decodeObject(forKey: SerializationKeys.overview) as? String
    self.popularity = aDecoder.decodeObject(forKey: SerializationKeys.popularity) as? Float
    self.voteAverage = aDecoder.decodeObject(forKey: SerializationKeys.voteAverage) as? Float
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.originalLanguage = aDecoder.decodeObject(forKey: SerializationKeys.originalLanguage) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(posterPath, forKey: SerializationKeys.posterPath)
    aCoder.encode(originCountry, forKey: SerializationKeys.originCountry)
    aCoder.encode(backdropPath, forKey: SerializationKeys.backdropPath)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(genreIds, forKey: SerializationKeys.genreIds)
    aCoder.encode(firstAirDate, forKey: SerializationKeys.firstAirDate)
    aCoder.encode(originalName, forKey: SerializationKeys.originalName)
    aCoder.encode(voteCount, forKey: SerializationKeys.voteCount)
    aCoder.encode(overview, forKey: SerializationKeys.overview)
    aCoder.encode(popularity, forKey: SerializationKeys.popularity)
    aCoder.encode(voteAverage, forKey: SerializationKeys.voteAverage)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(originalLanguage, forKey: SerializationKeys.originalLanguage)
  }

}
