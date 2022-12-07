//
//  SquareReposApiModel.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let squareReposAPIModel = try? newJSONDecoder().decode(SquareReposAPIModel.self, from: jsonData)

import Foundation

// MARK: - SquareReposAPIModel
struct SquareReposAPIModel: Codable {
    let id: Int
    let name: String?
    let fullName: String?
    let description: String?
    let stargazersCount: Int?
    let updatedAt: String?
}

