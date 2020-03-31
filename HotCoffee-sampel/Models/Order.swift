//
//  Order.swift
//  HotCoffee-sampel
//
//  Created by JONGWOO JIN on 2020/03/31.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable {
    case cappuccino
    case latte
    case espression
    case cortado
}

enum CoffeSize: String, Codable {
    case small
    case medium
    case large
}

struct  Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeSize
}