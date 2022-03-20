//
//  CatalogResponse.swift
//  SaryFlagship
//
//  Created by Guest Login on 18/03/2022.
//

import Foundation

// MARK: - CatalogResponse
struct CatalogResponse: Decodable {
    let result: [Catalog]?
    let other: Other?
    let message: String?
    let status: Bool?
}

// MARK: - Other
struct Other: Decodable {
    let showSpecialOrderView: Bool?
    let uncompletedProfileSettings: UncompletedProfileSettings?
    let businessStatus: BusinessStatus?

    enum CodingKeys: String, CodingKey {
        case showSpecialOrderView = "show_special_order_view"
        case uncompletedProfileSettings = "uncompleted_profile_settings"
        case businessStatus = "business_status"
    }
}

// MARK: - BusinessStatus
struct BusinessStatus: Decodable {
    let id: Int?
    let title: String?
}

// MARK: - UncompletedProfileSettings
struct UncompletedProfileSettings: Decodable {
    let showTag: Bool?
    let message: String?
    let image: String?
    let isCompletedProfile: Bool?

    enum CodingKeys: String, CodingKey {
        case showTag = "show_tag"
        case message, image
        case isCompletedProfile = "is_completed_profile"
    }
}

// MARK: - Result
struct Catalog: Decodable {
    let id: Int?
    let title: String?
    let data: [CatalogItem]?
    let dataType: String?
    let showTitle: Bool?
    let uiType: String?
    let rowCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, title, data
        case dataType = "data_type"
        case showTitle = "show_title"
        case uiType = "ui_type"
        case rowCount = "row_count"
    }
}

// MARK: - Datum
struct CatalogItem: Decodable {
    let groupID: Int?
    let filters: [Filter]?
    let name: String?
    let image: String?
    let emptyContentImage: String?
    let emptyContentMessage: String?
    let hasData, showUnavailableItems, showInBrochureLink: Bool?
    let deepLink: String?

    enum CodingKeys: String, CodingKey {
        case groupID = "group_id"
        case filters, name, image
        case emptyContentImage = "empty_content_image"
        case emptyContentMessage = "empty_content_message"
        case hasData = "has_data"
        case showUnavailableItems = "show_unavailable_items"
        case showInBrochureLink = "show_in_brochure_link"
        case deepLink = "deep_link"
    }
}

// MARK: - Filter
struct Filter: Decodable {
    let filterID: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case filterID = "filter_id"
        case name
    }
}
