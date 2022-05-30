//
//  BaseModel.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 15.05.2022.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let message: String
    let result: T
    let status: String
    let statusCode: Int
}

struct Category: Codable {
    let id: Int
    let img_url: String
    let name: String
    let prefix: String
}

struct Dish: Codable {
    let category_id: Int
    let description: String
    let id: Int
    let image_url: String
    let name: String
    let price: Int
}
