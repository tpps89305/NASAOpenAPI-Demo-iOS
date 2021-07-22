//
// Created by 楊朝富 on 2021/7/21.
//

import Foundation

// MARK: - ApodElement
struct ApodElement: Codable {
    let date, explanation: String
    let hdurl: String? // Add ? to avoid key not found error.
    let mediaType: String // Change to String to avoid DecodingError.
    let serviceVersion: String
    let title: String
    let url: String?
    let copyright: String?

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url, copyright
    }
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
