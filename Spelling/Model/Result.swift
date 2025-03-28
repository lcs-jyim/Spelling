//
//  Result.swift
//  Spelling
//
//  Created by junxi Yim on 2025/3/28.
//

import Foundation
struct Result:Identifiable {
    
    let id = UUID()
    // the item the user was supposed to guess
    let item:Item
    
    //what the user actually guessed
    let guessProvided: String
    
    // Whether the user was correct or not
    let outcome: Outcome
}
