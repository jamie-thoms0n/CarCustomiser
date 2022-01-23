//
//  Car.swift
//  CarCustomiser
//
//  Created by Jamie Thomson on 17/01/2022.
//

import Foundation

struct Car {
    let make:String
    let model : String
    var topSpeed : Int
    var acceleration: Double
    var handling: Int
    
    
    func displayStats() -> String {
        return ("Car Make: \(make)\nModel:\(model)\nTop Speed:\(topSpeed)\nAcceleration(0-60mph)\(acceleration)s\nhandling:\(handling)")
    }
}
