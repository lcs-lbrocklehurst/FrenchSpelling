//
//  QuizView.swift
//  FrenchSpelling
//
//  Created by Lewis Brocklehurst on 2024-01-15.
//

import SwiftUI

struct QuizView: View {
    //MARK: Stored properties
    @State var currentWord = vocabularyList.randomElement()!
    @State var answerGiven = ""
    @State var result: AnswerState = .NoInputGiven
    
    // List of prior questions
    @State var history: [Question] = [] // Empty to start
    
    // Keeps track of the filtering option that the user has selected
    @State var filteringOption: AnswerState = .NoInputGiven // Everything
    //MARK: Computed properties
    var body: some View {
        HStack {
            //Quiz Interface
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    Text("\(currentWord.english)")
                        .font(.custom( "Helvetica", size: 75.0))
                }
                
                
                Divider()
                
                HStack {
                    Text(result.rawValue)
                        .padding(20)
                    TextField(" ", text: $answerGiven)
                        .multilineTextAlignment(.trailing)
                        .padding(.leading)
                    
                }
                .font(.custom( "Helvetica", size: 96.0))
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //Check answer
                        checkAnswer()
                    }, label: {
                        Text("Submit")
                    })
                    Button(action: {
                        //Check answer
                       newQuestion()
                    }, label: {
                        Text("New Question")
                    })
                    
                }
            }
            // List of past questions
            VStack {
                
                // Picker to select filtering type
                Picker("Filtering on...", selection: $filteringOption) {
                    Text("nothing (show all questions)")
                        .tag(AnswerState.NoInputGiven)
                    Text("correct")
                        .tag(AnswerState.correct)
                    Text("incorrect")
                        .tag(AnswerState.incorrect)
                }
                // The list of questions
                List(
                    filtering(providedHistory: history, on: filteringOption)
                ) { currentQuestion in
                    HStack {
                        Text("\(currentQuestion.currentWord.english) = \(currentQuestion.answerGiven) (\(currentQuestion.currentWord.french)) \(currentQuestion.result.rawValue)")
                    }
            }
            }
        }
        .frame(width: 800, height: 400)
    }
    
    //MARK: Functions
    func checkAnswer() {
        let correctAnswer = currentWord.french
        
        if answerGiven == correctAnswer {
            // Tell the user they got it right
            result = .correct
        } else {
            result = .incorrect
        }
    }
    
    func newQuestion() {
        
        // Save the question just completed
        let oldQuestion = Question(
            currentWord: currentWord,
            answerGiven: answerGiven,
            result: result
        )
        
            // Add it to the history
        history.insert(oldQuestion, at: 0)
        
        // Resets everything
         currentWord = vocabularyList.randomElement()!
         answerGiven = ""
        result = .NoInputGiven
    }
        
    
}

#Preview {
    QuizView()
}
