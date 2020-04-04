//
//  PopularServices.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/4/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//


import Foundation
import Alamofire
import Moya

let tmdbApiKey = "647f1b2b2772a876099da5b545b40246"

enum AnimeServices {
    
    case getAnimeList(type : Int, page: String)
    case getDetailAnime(id: String)
    case getSoundtrack(name: String)
    case getEpisode(id: String, seasons: String)
}

extension AnimeServices: TargetType {
    
    var baseURL: URL {

        switch self {
        case .getAnimeList(_):
            return URL.init(string: "https://api.themoviedb.org/3/")!
        case .getDetailAnime(_):
            return URL.init(string: "https://api.themoviedb.org/3/tv/")!
        case .getSoundtrack(_):
            return URL.init(string: "https://itunes.apple.com/search")!
        case .getEpisode(let id, let seasons):
            return URL.init(string: "https://api.themoviedb.org/3/tv/\(id)/season/\(seasons)")!
        }
        
    }
    
    var path: String {
        switch self {
        case .getAnimeList(let type, _):
            if type == 1{
                return "tv/popular"
            }else if type == 2{
                return "tv/top_rated"
            }else if type == 3 {
                return "tv/on_the_air"
            } else {
                return "discover/tv"
            }
        case .getDetailAnime(let id):
            return id
        case .getSoundtrack(_):
            return ""
            
        case .getEpisode(_):
            return ""
        }

    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Moya.Data {
        return Moya.Data.init()
    }
    
    var task: Task {
        
        var param = Parameters()
        
        switch self {
        case .getAnimeList( _, let page):
            param["with_original_language"] = "ja"
            param["with_genres"] = 16
            param["page"] = page
            
        case .getDetailAnime(_):
            param["append_to_response"] = "credits,images,videos"
            
        case .getSoundtrack(let name):
            param["entity"] = "album"
            param["media"] = "music"
            param["term"] = name
            
        case .getEpisode(_):
            break
        }
        
        param["api_key"] = tmdbApiKey
        return .requestParameters(parameters: param, encoding: URLEncoding.default)
    }
    
    var headers: [String: String]? {
        return nil
    }
}


