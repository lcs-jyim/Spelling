//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    
    //what the user has guessed
    @State var userGuess = ""
    
    //What aws the outcome of a user making a guess?
    @State var currentOutcome: Outcome = .undetermined
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                TextField("Enter the name of the item", text: $userGuess)
                Button {
                    checkGuess()
                }label:{
                    Text("Submit")
                }
                Text(currentOutcome.rawValue)
            }
        }
    }
        func checkGuess() {
            if userGuess == currentItem.word{
                currentOutcome = .correct
                print("Correct")
            }else{
                currentOutcome = .incorrect
                print("Incorrect")
            }
        }
    }
    
    #Preview {
        QuizView()
    }
