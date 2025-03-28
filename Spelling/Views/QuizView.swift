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
    
    @State var history:[Result] = [] // empty Array
    // MARK: Computed properties
    var body: some View {
        HStack{
            // Left side
            VStack {
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                HStack{
                    TextField("Enter the name of the item", text: $userGuess)
                    
                    Text(currentOutcome.rawValue)
                }
                HStack{
                    Button {
                        checkGuess()
                        
                    }label:{
                        Text("Submit")
                    }
                    Button {
                        newWord()
                    }label:{
                        Text("New word")
                    }
                }
            }
            
            // Right side
            List(history){ currentResult in
                HStack{
                Image(currentResult.item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:50)
                                    Text(currentResult.guessProvided)
                    
                    Spacer()
                    
                    Text(currentResult.outcome.rawValue)
                }
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
    func newWord(){
        //Save the prior result
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ), at: 0
        )
        //Picks a new word
        currentItem = itemsToSpell.randomElement()!
        userGuess = ""
        currentOutcome = .undetermined
    }
    }
    
    #Preview {
        QuizView()
    }
