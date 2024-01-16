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
    //MARK: Computed properties
    var body: some View {
        HStack {
            //Quiz Interface
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    Text("\(currentWord.english)")
                        .font(.custom( "Helvetica", size: 96.0))
                }
                
                
                Divider()
                
                HStack {
                    Text(result.rawValue)
                        .padding(20)
                    TextField("Answer", text: $answerGiven)
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
            Text ("History")
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
