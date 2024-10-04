//
//  ThirdViewData.swift
//  3rd_hw_HyeonSeungHun
//
//  Created by 현승훈 on 10/4/24.
//

import UIKit

struct ThirdViewData {
    var title: String
    var thirdMainImage : String
    var script: String
    var category : String
    var date : String
}


extension ThirdViewData {
    static var thirdmodeling = [
       [ ThirdViewData(title:"Castle & Castle" , thirdMainImage: "thirdMovie1" , script: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, \n vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. \n Massa,  id ut ipsum aliquam enim non  posuere pulvinar diam.", category: "Steamy • Soapy • Slow Burn • Suspenseful • Teen • Mystery" , date:"Season 1 Coming December 14"),
        ],
        [ThirdViewData(title:"Tiny Pretty Things" , thirdMainImage: "thirdMovie2" , script: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, \n vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. \n Massa,  id ut ipsum aliquam enim non  posuere pulvinar diam.",category: "Steamy • Soapy • Slow Burn • Suspenseful • Teen • Mystery",date:"Season 1 Coming December 14"),
        ],
        [ThirdViewData(title:"Faster" , thirdMainImage: "thirdMovie3" , script: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, \n vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. \n Massa,  id ut ipsum aliquam enim non  posuere pulvinar diam.",category: "Steamy • Soapy • Slow Burn • Suspenseful • Teen • Mystery",date:"Season 1 Coming December 14"),
        ]
    ]
}
