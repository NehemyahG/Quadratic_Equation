//
//  NewQuadratic.swift
//  Quadratic Project
//
//  Created by IIT PHYS 440 on 1/24/23.
//

import SwiftUI
import Foundation

class NewQuadratic: NSObject {
    var varA = "0.0"
    var varB = "0.0"
    var varC = "0.0"
    var solution_string :(String, Double, Double, Double, Double) = ("", 0.0, 0.0, 0.0, 0.0)
    var discriminant = 0.0
    var solv_disc = 0.0
    var error = 0.0
    ///
    ///Takes the new quadratic equation gave in the Landau text, and duplicates it by the form, to place the nonexistent in the numerator, assuming there are two complex roots.
    ///
    ///If sqrtDisc is imaginary:
    ///
    ///   -2c                      b -/+ sqrtdisc        2c (b -/+ sqrtdisc)
    ///----------------    * -------------------- = -----------------------
    ///b +/- sqrtDisc          b -/+ sqrt disc        b^2 + sqrtDisc   -> since sqrtDisc is imaginary (e.g. isqrt(3)), squaring it would result in -sqrtDisc^2, such that b^2 - i^2 * sqrtDisc^2 = b^2 + sqrtDisc^2
    ///
    func calculateTypeofSolutions()  {
        var a = Double(varA)!
        var b = Double(varB)!
        var c = Double(varC)!
 
        
        
        discriminant = ((b * b) - (4 * a * c))
        
        switch discriminant {
        case let x where x < 0:
            let sqrtDisc = sqrt(-discriminant)
            solution_string.0 = "Two Complex Roots"
            solution_string.1 = ((-2 * c) * b) / ((b * b) + (sqrtDisc * sqrtDisc))
            solution_string.2 = (-2 * c * sqrtDisc) / ((b * b) + (sqrtDisc * sqrtDisc))
            solution_string.3 = ((-2 * c) * b) / ((b * b) + (sqrtDisc * sqrtDisc))
            solution_string.4 = (-2 * c * sqrtDisc) / ((b * b) + (sqrtDisc * sqrtDisc) )
            
            
        case let x where x == 0:
            solution_string.0 = "One Real Root"
            solution_string.1 = (-2 * c) / (b)
            solution_string.2 = 0.0
            solution_string.3 = (-2 * c) / (b)
            solution_string.4 = 0.0
        case let x where x > 0:
            solution_string.0 = "Two Real Roots"
            let sqrtDisc = sqrt(discriminant)
            solution_string.1 = (-2 * c) / (b + sqrtDisc)
            solution_string.2 = 0.0
            solution_string.3 = (-2 * c) / (b - sqrtDisc)
            solution_string.4 = 0.0
        default:
            return solution_string.0 = "ERROR"
        }
        if solution_string.0 == "Two Complex Roots"{
            solv_disc = -((1 / solution_string.1) * (-2 * c * b) - (b * b))
        }
        else {
            solv_disc = -((solution_string.1 * (2 * a)) + b) * (-((solution_string.1 * (2 * a)) + b))
        }
        error = discriminant - solv_disc
    
    }
    }
