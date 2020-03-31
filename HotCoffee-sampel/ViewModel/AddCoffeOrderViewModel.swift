//
//  AddCoffeOrderViewModel.swift
//  HotCoffee-sampel
//
//  Created by JONGWOO JIN on 2020/03/31.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation

struct  AddCoffeeOrderViewModel {
    var name : String?
    var email: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized}
    }
    
    var size: [String] {
        return CoffeSize.allCases.map { $0.rawValue.capitalized}
    }
}
