//
//  BannerResult.swift
//  SaryFlagship
//
//  Created by Guest Login on 18/03/2022.
//

import Foundation

// MARK: - BannerResponse
struct BannerResponse: Decodable {
    let result: [Banner]?
    let status: Bool?
    
}

// MARK: - Result
struct Banner: Decodable {
    let id: Int?
    let title, resultDescription, buttonText: String?
    let expiryStatus: Bool?
    let createdAt, startDate, expiryDate: String?
    let image: String?
    let priority: Int?
    let photo: String?
    let link, level: String?
    let isAvailable: Bool?
    let branch: Int?

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case buttonText = "button_text"
        case expiryStatus = "expiry_status"
        case createdAt = "created_at"
        case startDate = "start_date"
        case expiryDate = "expiry_date"
        case image, priority, photo, link, level
        case isAvailable = "is_available"
        case branch
    }
}
