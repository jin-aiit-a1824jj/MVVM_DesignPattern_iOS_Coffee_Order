//
//  Order.swift
//  HotCoffee-sampel
//
//  Created by JONGWOO JIN on 2020/03/31.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case espression
    case cortado
}

enum CoffeSize: String, Codable, CaseIterable {
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

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel){
        guard let name = vm.name,
                 let email = vm.email,
                 let selectecType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
                 let selectedSize = CoffeSize(rawValue: vm.selectedSize!.lowercased()) else {
                return nil
        }
        
        self.name = name
        self.email = email
        self.type = selectecType
        self.size = selectedSize
    }
}
