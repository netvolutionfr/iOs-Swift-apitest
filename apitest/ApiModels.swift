// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - User
struct User: Codable, Identifiable, Hashable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable, Hashable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable, Hashable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable, Hashable {
    let name, catchPhrase, bs: String
}

typealias Users = [User]

