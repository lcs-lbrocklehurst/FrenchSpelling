//
//  Question.swift
//  FrenchSpelling
//
//  Created by Lewis Brocklehurst on 2024-01-15.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let currentWord : Word
    let answerGiven : String
    let result: AnswerState
}
