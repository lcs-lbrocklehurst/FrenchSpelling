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
    
    //MARK: Computed properties
    var body: some View {
        HStack {
            //Quiz Interface
            VStack {
                HStack {
                    Spacer()
                    Text("\(currentWord.english)")
                        .font(.custom( "Helvetica", size: 96.0))
                }
                
                
                Divider()
                
                TextField("Answer", text: $answerGiven)
                    .font(.custom( "Helvetica", size: 96.0))
                    .multilineTextAlignment(.trailing)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //Check answer
                    }, label: {
                        Text("Submit")
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
}

#Preview {
    QuizView()
}
