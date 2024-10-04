//
//  Searchbar.swift
//  3rd_hw_HyeonSeungHun
//
//  Created by 현승훈 on 10/2/24.
//

import UIKit

class Searchbar: UIViewController{
    let SearchController = UISearchController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationItem.title = "Search"
        
        navigationItem	.searchController = SearchController
    }
}
