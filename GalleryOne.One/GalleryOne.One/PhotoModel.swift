//
//  PhotoModel.swift
//  GalleryOne.One
//
//  Created by Дрозд Денис on 15.10.2023.
//

import Foundation

struct PhotoModel: Decodable {
    let totalItems : Int
    let itemsPerPage: Int
    let countOfPages: Int
    let data : [DataArray]
}

struct DataArray: Decodable {
    let id : Int
    let name : String
    let description : String
    let image: DataImage
    
}

struct DataImage: Decodable {
    let id : Int
    let name : String
}


//"totalItems": 71,
//"itemsPerPage": 30,
//"countOfPages": 3,
//"data": [
//  {
//    "id": 2,
//    "name": "гениальный черный квадрат ",
//    "dateCreate": "2022-07-26T00:19:54+00:00",
//    "description": "гениальнее никуда ",
//    "new": false,
//    "popular": true,
//    "image": {
//      "id": 3,
//      "name": "62dec2911cfc9446702793.jpg"
//    }
