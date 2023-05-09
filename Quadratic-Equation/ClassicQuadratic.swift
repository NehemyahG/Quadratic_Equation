//
//  ClassicQuadratic.swift
//  Quadratic Project
//
//  Created by IIT PHYS 440 on 1/20/23.
//
import SwiftUI
import Foundation

class ClassicQuadratic: NSObject {
    var varA = "0.0"
    var varB = "0.0"
    var varC = "0.0"
    var solution_string :(String, Double, Double, Double, Double) = ("", 0.0, 0.0, 0.0, 0.0)
    var discriminant = 0.0
    var solv_disc = 0.0
    var error = 0.0
    
    
    /// The discriminant (b2 - 4ac) is first identified by this function before the analytical solutions to quadratic equations can be calculated. Then, depending on the disciminant's shape, it performs a switch case. The part of the tuple that contains the "imaginary" part is displayed as 0, and the "real" part of the tuple calculates the simplified form of the quadratic formula without the imaginary part if the discriminant is equal to or greater than zero. As a result, there are no imaginary numbers to display.
    ///
    /// The tuple is made up of five parts. The type of solutions being calculated (one/two real roots, or two complex roots) is all that solutionstring.0 shows. If there is only one solution, these tuples, solutionstring.1 and solutionstring.3, display the actual portions of the two solutions. The fictitious portions of the solutions are shown in solutionstring.2 and 4. The computer does not recognize the "i" as a number, so it must be removed.
    ///
    /// The square root of the discriminat is redefined in the event that the discriminant is less than 0, thereby removing the imaginary portion of the discriminat, which will be reinstated when it is displayed in ContentView.
    ///
    ///   Real              Imaginary (=0 if only one real root)
    ///   - b          sqrt(Discriminant)
    ///    ---  +/-  ---------------------
    ///    2a                   2a
    func calculateTypeofSolutions()  {
        var a = Double(varA)!
        var b = Double(varB)!
        var c = Double(varC)!
        
        discriminant = ((b * b) - (4 * a * c))
        
        switch discriminant {
        case let x where x < 0:
            let sqrtDisc = sqrt(-discriminant)
            solution_string.0 = "Two Complex Roots"
            solution_string.1 = (-b) / (2 * a)
            solution_string.2 = (sqrtDisc/(2*a))
            solution_string.3 = (-b) / (2 * a)
            solution_string.4 = -(sqrtDisc/(2*a))
        case let x where x == 0:
            solution_string.0 = "One Real Root"
            solution_string.1 = (-b) / (2 * a)
            solution_string.2 = 0.0
            solution_string.3 = (-b) / (2 * a)
            solution_string.4 = 0.0
        case let x where x > 0:
            solution_string.0 = "Two Real Roots"
            let sqrtDisc = sqrt(discriminant)
            solution_string.1 = (-b + sqrtDisc) / (2 * a)
            solution_string.2 = 0.0
            solution_string.3 = (-b - sqrtDisc) / (2 * a)
            solution_string.4 = 0.0
        default:
            return solution_string.0 = "ERROR"
        }
        
        /// This capability is utilized to find how much mistake produced by the subtractive scratch-off. Accordingly, we take the arrangements, and yet again input them into the issue, attempting to track down the Discriminant by turn around tasks.
        ///
        /// e.g. solution of X from:
        ///
        ///    -b +/- sqrt(discriminant)
        ///    ----------------------------  = X   => 2X a = -b +/- sqrtDisc  -> 2Xa + b = +/- sqrtDisc
        ///             2a
        
        if solution_string.0 == "Two Complex Roots" {
            solv_disc = -((solution_string.2 * 2 * a) * (solution_string.2 * 2 * a))
        }
        else {
            solv_disc = -((solution_string.1 * (2 * a)) + b) * (-((solution_string.1 * (2 * a)) + b))
          
        }
        error = discriminant - solv_disc
    }
    
    
    }
