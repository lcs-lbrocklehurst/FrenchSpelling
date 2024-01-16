//
//  SharedFunctions.swift
//  FrenchSpelling
//
//  Created by Lewis Brocklehurst on 2024-01-16.
//

import Foundation

func filtering(providedHistory: [Question], on answerState: AnswerState) -> [Question] {
    
    // When the answer State is "no input given" return the entire list of questions
    if answerState == .NoInputGiven {
        return providedHistory
    }
    // Otherwise filter based on correct or incorrect
    var filteredHistory: [Question] = []
    for question in providedHistory {
        
        if question.result == answerState{
            // Add to the array to be returned
            filteredHistory.append(question)
        }
        
    }
    // Return to the filtered array
    return filteredHistory
}
