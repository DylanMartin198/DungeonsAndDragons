//
//  API.swift
//  D&D
//
//  Created by Dylan Martin on 3/9/23.
//

import Foundation

enum APIError: Error, LocalizedError {
    case requestNotFound
}

struct Response: Codable {
    var response: String
}

let url = "https://api.openai.com/v1/engines/davinci-codex/completions"

let apiKey = "YOUR_API_KEY_HERE"

struct ApiCall {
    
//    func fetchResponse(with question: String) async throws -> Response {
//        var request = URLRequest(url: URL(string: url)!)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//
//            request.queryItems = [
//            "prompt": "Dungeons And Dragons Journey",
//            "max_tokens": 50,
//            "temperature": 0.5
//        ] as [String : Any]
//
//        let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
//
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw APIError.requestNotFound
//        }
//        let decoder = JSONDecoder()
//        let text = try decoder.decode(Response.self, from: data)
//        print(text)
//        return text
//    }
}

//let baseURL = URL(string: "http://www.omdbapi.com/")!
//
//let apiKey = "APIKEY"
//
//func fetchMovies(with searchTerm: String) async throws -> [APIMovie] {
//             var searchURL = baseURL
//             let searchItem = URLQueryItem(name: "s", value: searchTerm)
//             let apiKeyItem = URLQueryItem(name: "apiKey", value: apiKey)
//             searchURL.append(queryItems: [searchItem, apiKeyItem])
//             let (data, _) = try await URLSession.shared.data(from: searchURL)
//             let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
//             return searchResponse.movies
//}
