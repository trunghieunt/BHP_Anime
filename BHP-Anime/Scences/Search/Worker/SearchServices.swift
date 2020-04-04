//
//  SearchServices.swift
//  BHP-Anime
//
//  Created by Nguyen Trung Hieu on 3/7/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//


import Foundation
import Alamofire
import Moya


enum SearchServices {
    case getAnime(query : String, page: String)
}

extension SearchServices: TargetType {
    
    var baseURL: URL {
        return URL.init(string: "http://api.themoviedb.org/3/search/tv")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Moya.Data {
        return Moya.Data.init()
    }
    
    var task: Task {
        switch self {
        case .getAnime(let query, let page):
            var param = Parameters()
                param["api_key"] = "647f1b2b2772a876099da5b545b40246"
                param["with_original_language"] = "ja"
                param["query"] = query
                param["page"] = page
            
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

