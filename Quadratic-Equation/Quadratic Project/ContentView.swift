//
//  ContentView.swift
//  Quadratic Project
//
//  Created by IIT PHYS 440 on 1/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var varA = ""
    @State var varB = ""
    @State var varC = ""
    @State var solution_classic_string = ""
    @State var first_classic_solution_string = ""
    @State var second_classic_solution_string = ""
    @State var solution_string = ""
    @State var first_solution_string = ""
    @State var second_solution_string = ""
   
    var body: some View {
   
            VStack {
                HStack {
                    Text("a = ")
                    TextField("Enter a value for a", text: $varA)
                        .padding()
            
                    Text("b = ")
                    TextField("Enter a value for b", text: $varB)
                        .padding()
            
                    Text("c = ")
                    TextField("Enter a value for c", text: $varC)
                        .padding()
                }
             
                Button(action: {
                    self.calculateQuadratic()
                    self.calculateNewQuadratic()
                }) {
                    Text ("Calculate Quadratic Solutions Using Both Methods")
                }
                
                HStack{
                    VStack{
                        Text(solution_classic_string)
                            .padding()
                        Text(first_classic_solution_string)
                            .padding()
                        Text(second_classic_solution_string)
                            .padding()
                    }
                    VStack{
                        Text(solution_string)
                            .padding()
                        Text(first_solution_string)
                            .padding()
                        Text(second_solution_string)
                            .padding()
                    }
                }
               
              
                
            }
        
                
    }
    func calculateQuadratic(){
        
        let myquadraticclassinstance = ClassicQuadratic()
        myquadraticclassinstance.varA = varA
        myquadraticclassinstance.varB = varB
        myquadraticclassinstance.varC = varC
        
        myquadraticclassinstance.calculateTypeofSolutions()
        
        
      //  let solutiontypestring = myquadraticclassinstance.calculateTypeofSolutions(myquadraticclassinstance.solutionstring.0)
      //  let finalsolutionstring = myquadraticclassinstance.calculateTypeofSolutions(solutionstring.1)
        
        self.solution_classic_string = "The solutions of the classic quadratic are composed of \( myquadraticclassinstance.solution_string.0)"
        self.first_classic_solution_string = "The first classic solution is \( myquadraticclassinstance.solution_string.1) + \(myquadraticclassinstance.solution_string.2)i"
        self.second_classic_solution_string = "The second classic solution is \( myquadraticclassinstance.solution_string.3) - \(abs(myquadraticclassinstance.solution_string.4))i"
    }
    
    func calculateNewQuadratic(){
        
        let mynewquadraticclassinstance = NewQuadratic()
        mynewquadraticclassinstance.varA = varA
        mynewquadraticclassinstance.varB = varB
        mynewquadraticclassinstance.varC = varC
        
        mynewquadraticclassinstance.calculateTypeofSolutions()
        
        
      //  let solutiontypestring = myquadraticclassinstance.calculateTypeofSolutions(myquadraticclassinstance.solutionstring.0)
      //  let finalsolutionstring = myquadraticclassinstance.calculateTypeofSolutions(solutionstring.1)
        
        self.solution_string = "The solutions of the new quadratic are composed of \( mynewquadraticclassinstance.solution_string.0)"
        self.first_solution_string = "The first solution is \( mynewquadraticclassinstance.solution_string.1) + \(mynewquadraticclassinstance.solution_string.2)i"
        self.second_solution_string = "The second solution is \( mynewquadraticclassinstance.solution_string.3) - \(abs(mynewquadraticclassinstance.solution_string.4))i"
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
