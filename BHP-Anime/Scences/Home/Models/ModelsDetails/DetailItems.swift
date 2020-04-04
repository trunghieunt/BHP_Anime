//
//  DetailItems.swift
//
//  Created by Nguyen Trung Hieu on 4/2/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DetailItems: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let backdropPath = "backdrop_path"
    static let numberOfEpisodes = "number_of_episodes"
    static let firstAirDate = "first_air_date"
    static let languages = "languages"
    static let originalName = "original_name"
    static let recommendations = "recommendations"
    static let type = "type"
    static let voteCount = "vote_count"
    static let numberOfSeasons = "number_of_seasons"
    static let overview = "overview"
    static let credits = "credits"
    static let lastEpisodeToAir = "last_episode_to_air"
    static let lastAirDate = "last_air_date"
    static let id = "id"
    static let voteAverage = "vote_average"
    static let videos = "videos"
    static let images = "images"
    static let productionCompanies = "production_companies"
    static let homepage = "homepage"
    static let posterPath = "poster_path"
    static let originCountry = "origin_country"
    static let name = "name"
    static let genres = "genres"
    static let episodeRunTime = "episode_run_time"
    static let reviews = "reviews"
    static let inProduction = "in_production"
    static let networks = "networks"
    static let status = "status"
    static let popularity = "popularity"
    static let seasons = "seasons"
    static let createdBy = "created_by"
    static let originalLanguage = "original_language"
  }

  // MARK: Properties
  public var backdropPath: String?
  public var numberOfEpisodes: Int?
  public var firstAirDate: String?
  public var languages: [String]?
  public var originalName: String?
  public var recommendations: Recommendations?
  public var type: String?
  public var voteCount: Int?
  public var numberOfSeasons: Int?
  public var overview: String?
  public var credits: Credits?
  public var lastEpisodeToAir: LastEpisodeToAir?
  public var lastAirDate: String?
  public var id: Int?
  public var voteAverage: Float?
  public var videos: Videos?
  public var images: Images?
  public var productionCompanies: [ProductionCompanies]?
  public var homepage: String?
  public var posterPath: String?
  public var originCountry: [String]?
  public var name: String?
  public var genres: [Genres]?
  public var episodeRunTime: [Int]?
  public var reviews: Reviews?
  public var inProduction: Bool? = false
  public var networks: [Networks]?
  public var status: String?
  public var popularity: Float?
  public var seasons: [Seasons]?
  public var createdBy: [CreatedBy]?
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
    backdropPath = json[SerializationKeys.backdropPath].string
    numberOfEpisodes = json[SerializationKeys.numberOfEpisodes].int
    firstAirDate = json[SerializationKeys.firstAirDate].string
    if let items = json[SerializationKeys.languages].array { languages = items.map { $0.stringValue } }
    originalName = json[SerializationKeys.originalName].string
    recommendations = Recommendations(json: json[SerializationKeys.recommendations])
    type = json[SerializationKeys.type].string
    voteCount = json[SerializationKeys.voteCount].int
    numberOfSeasons = json[SerializationKeys.numberOfSeasons].int
    overview = json[SerializationKeys.overview].string
    credits = Credits(json: json[SerializationKeys.credits])
    lastEpisodeToAir = LastEpisodeToAir(json: json[SerializationKeys.lastEpisodeToAir])
    lastAirDate = json[SerializationKeys.lastAirDate].string
    id = json[SerializationKeys.id].int
    voteAverage = json[SerializationKeys.voteAverage].float
    videos = Videos(json: json[SerializationKeys.videos])
    images = Images(json: json[SerializationKeys.images])
    if let items = json[SerializationKeys.productionCompanies].array { productionCompanies = items.map { ProductionCompanies(json: $0) } }
    homepage = json[SerializationKeys.homepage].string
    posterPath = json[SerializationKeys.posterPath].string
    if let items = json[SerializationKeys.originCountry].array { originCountry = items.map { $0.stringValue } }
    name = json[SerializationKeys.name].string
    if let items = json[SerializationKeys.genres].array { genres = items.map { Genres(json: $0) } }
    if let items = json[SerializationKeys.episodeRunTime].array { episodeRunTime = items.map { $0.intValue } }
    reviews = Reviews(json: json[SerializationKeys.reviews])
    inProduction = json[SerializationKeys.inProduction].boolValue
    if let items = json[SerializationKeys.networks].array { networks = items.map { Networks(json: $0) } }
    status = json[SerializationKeys.status].string
    popularity = json[SerializationKeys.popularity].float
    if let items = json[SerializationKeys.seasons].array { seasons = items.map { Seasons(json: $0) } }
    if let items = json[SerializationKeys.createdBy].array { createdBy = items.map { CreatedBy(json: $0) } }
    originalLanguage = json[SerializationKeys.originalLanguage].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = backdropPath { dictionary[SerializationKeys.backdropPath] = value }
    if let value = numberOfEpisodes { dictionary[SerializationKeys.numberOfEpisodes] = value }
    if let value = firstAirDate { dictionary[SerializationKeys.firstAirDate] = value }
    if let value = languages { dictionary[SerializationKeys.languages] = value }
    if let value = originalName { dictionary[SerializationKeys.originalName] = value }
    if let value = recommendations { dictionary[SerializationKeys.recommendations] = value.dictionaryRepresentation() }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
    if let value = numberOfSeasons { dictionary[SerializationKeys.numberOfSeasons] = value }
    if let value = overview { dictionary[SerializationKeys.overview] = value }
    if let value = credits { dictionary[SerializationKeys.credits] = value.dictionaryRepresentation() }
    if let value = lastEpisodeToAir { dictionary[SerializationKeys.lastEpisodeToAir] = value.dictionaryRepresentation() }
    if let value = lastAirDate { dictionary[SerializationKeys.lastAirDate] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
    if let value = videos { dictionary[SerializationKeys.videos] = value.dictionaryRepresentation() }
    if let value = images { dictionary[SerializationKeys.images] = value.dictionaryRepresentation() }
    if let value = productionCompanies { dictionary[SerializationKeys.productionCompanies] = value.map { $0.dictionaryRepresentation() } }
    if let value = homepage { dictionary[SerializationKeys.homepage] = value }
    if let value = posterPath { dictionary[SerializationKeys.posterPath] = value }
    if let value = originCountry { dictionary[SerializationKeys.originCountry] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = genres { dictionary[SerializationKeys.genres] = value.map { $0.dictionaryRepresentation() } }
    if let value = episodeRunTime { dictionary[SerializationKeys.episodeRunTime] = value }
    if let value = reviews { dictionary[SerializationKeys.reviews] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.inProduction] = inProduction
    if let value = networks { dictionary[SerializationKeys.networks] = value.map { $0.dictionaryRepresentation() } }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = popularity { dictionary[SerializationKeys.popularity] = value }
    if let value = seasons { dictionary[SerializationKeys.seasons] = value.map { $0.dictionaryRepresentation() } }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value.map { $0.dictionaryRepresentation() } }
    if let value = originalLanguage { dictionary[SerializationKeys.originalLanguage] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.backdropPath = aDecoder.decodeObject(forKey: SerializationKeys.backdropPath) as? String
    self.numberOfEpisodes = aDecoder.decodeObject(forKey: SerializationKeys.numberOfEpisodes) as? Int
    self.firstAirDate = aDecoder.decodeObject(forKey: SerializationKeys.firstAirDate) as? String
    self.languages = aDecoder.decodeObject(forKey: SerializationKeys.languages) as? [String]
    self.originalName = aDecoder.decodeObject(forKey: SerializationKeys.originalName) as? String
    self.recommendations = aDecoder.decodeObject(forKey: SerializationKeys.recommendations) as? Recommendations
    self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? String
    self.voteCount = aDecoder.decodeObject(forKey: SerializationKeys.voteCount) as? Int
    self.numberOfSeasons = aDecoder.decodeObject(forKey: SerializationKeys.numberOfSeasons) as? Int
    self.overview = aDecoder.decodeObject(forKey: SerializationKeys.overview) as? String
    self.credits = aDecoder.decodeObject(forKey: SerializationKeys.credits) as? Credits
    self.lastEpisodeToAir = aDecoder.decodeObject(forKey: SerializationKeys.lastEpisodeToAir) as? LastEpisodeToAir
    self.lastAirDate = aDecoder.decodeObject(forKey: SerializationKeys.lastAirDate) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.voteAverage = aDecoder.decodeObject(forKey: SerializationKeys.voteAverage) as? Float
    self.videos = aDecoder.decodeObject(forKey: SerializationKeys.videos) as? Videos
    self.images = aDecoder.decodeObject(forKey: SerializationKeys.images) as? Images
    self.productionCompanies = aDecoder.decodeObject(forKey: SerializationKeys.productionCompanies) as? [ProductionCompanies]
    self.homepage = aDecoder.decodeObject(forKey: SerializationKeys.homepage) as? String
    self.posterPath = aDecoder.decodeObject(forKey: SerializationKeys.posterPath) as? String
    self.originCountry = aDecoder.decodeObject(forKey: SerializationKeys.originCountry) as? [String]
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.genres = aDecoder.decodeObject(forKey: SerializationKeys.genres) as? [Genres]
    self.episodeRunTime = aDecoder.decodeObject(forKey: SerializationKeys.episodeRunTime) as? [Int]
    self.reviews = aDecoder.decodeObject(forKey: SerializationKeys.reviews) as? Reviews
    self.inProduction = aDecoder.decodeBool(forKey: SerializationKeys.inProduction)
    self.networks = aDecoder.decodeObject(forKey: SerializationKeys.networks) as? [Networks]
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
    self.popularity = aDecoder.decodeObject(forKey: SerializationKeys.popularity) as? Float
    self.seasons = aDecoder.decodeObject(forKey: SerializationKeys.seasons) as? [Seasons]
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? [CreatedBy]
    self.originalLanguage = aDecoder.decodeObject(forKey: SerializationKeys.originalLanguage) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(backdropPath, forKey: SerializationKeys.backdropPath)
    aCoder.encode(numberOfEpisodes, forKey: SerializationKeys.numberOfEpisodes)
    aCoder.encode(firstAirDate, forKey: SerializationKeys.firstAirDate)
    aCoder.encode(languages, forKey: SerializationKeys.languages)
    aCoder.encode(originalName, forKey: SerializationKeys.originalName)
    aCoder.encode(recommendations, forKey: SerializationKeys.recommendations)
    aCoder.encode(type, forKey: SerializationKeys.type)
    aCoder.encode(voteCount, forKey: SerializationKeys.voteCount)
    aCoder.encode(numberOfSeasons, forKey: SerializationKeys.numberOfSeasons)
    aCoder.encode(overview, forKey: SerializationKeys.overview)
    aCoder.encode(credits, forKey: SerializationKeys.credits)
    aCoder.encode(lastEpisodeToAir, forKey: SerializationKeys.lastEpisodeToAir)
    aCoder.encode(lastAirDate, forKey: SerializationKeys.lastAirDate)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(voteAverage, forKey: SerializationKeys.voteAverage)
    aCoder.encode(videos, forKey: SerializationKeys.videos)
    aCoder.encode(images, forKey: SerializationKeys.images)
    aCoder.encode(productionCompanies, forKey: SerializationKeys.productionCompanies)
    aCoder.encode(homepage, forKey: SerializationKeys.homepage)
    aCoder.encode(posterPath, forKey: SerializationKeys.posterPath)
    aCoder.encode(originCountry, forKey: SerializationKeys.originCountry)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(genres, forKey: SerializationKeys.genres)
    aCoder.encode(episodeRunTime, forKey: SerializationKeys.episodeRunTime)
    aCoder.encode(reviews, forKey: SerializationKeys.reviews)
    aCoder.encode(inProduction, forKey: SerializationKeys.inProduction)
    aCoder.encode(networks, forKey: SerializationKeys.networks)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(popularity, forKey: SerializationKeys.popularity)
    aCoder.encode(seasons, forKey: SerializationKeys.seasons)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(originalLanguage, forKey: SerializationKeys.originalLanguage)
  }

}
