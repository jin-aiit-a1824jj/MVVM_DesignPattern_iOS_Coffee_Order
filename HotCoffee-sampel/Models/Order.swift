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

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else { fatalError("URL is incorrect!") }
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "") else {
            fatalError("URL is Incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resourse = Resource<Order?>(url: url)
        resourse.httpMethod = .post
        resourse.body = data

        return resourse
    }
}
