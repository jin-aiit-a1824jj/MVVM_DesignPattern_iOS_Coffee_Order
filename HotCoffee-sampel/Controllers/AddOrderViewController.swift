//
//  AddOrderViewController.swift
//  HotCoffee-sampel
//
//  Created by JONGWOO JIN on 2020/03/31.
//  Copyright © 2020 JONGWOO JIN. All rights reserved.
//

import Foundation
import UIKit

class AddOrderNewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // stroyboardにて紐付いた
       // self.tableView.delegate = self
       // self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = self.vm.types[indexPath.row]
        return cell
    }
    
    private var vm = AddCoffeeOrderViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
}
