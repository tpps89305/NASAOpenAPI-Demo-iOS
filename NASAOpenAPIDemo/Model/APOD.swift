//
// Created by 楊朝富 on 2021/7/21.
//

import Foundation

// MARK: - ApodElement
struct ApodElement: Codable {
    let date, explanation: String
    let hdurl: String
    let mediaType: MediaType
    let serviceVersion: ServiceVersion
    let title: String
    let url: String
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url, copyright
    }
}

enum MediaType: String, Codable {
    case image = "image"
}

enum ServiceVersion: String, Codable {
    case v1 = "v1"
}

/// APOD = Astronomy Picture of the Day
typealias Apod = [ApodElement]

// MARK: - Helper functions for creating encoders and decoders

func APODJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func APODJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

//extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        self.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completionHandler(nil, response, error)
//                return
//            }
//            print("Apod origin data = \(String(data: data, encoding: String.Encoding.utf8) ?? "(no result)")")
//            completionHandler(try? APODJSONDecoder().decode(T.self, from: data), response, nil)
//        }
//    }
//
//    func apodTask(with url: URL, completionHandler: @escaping (Apod?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}