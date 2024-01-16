//
//  QuizView.swift
//  FrenchSpelling
//
//  Created by Lewis Brocklehurst on 2024-01-15.
//

import SwiftUI

struct QuizView: View {
    @State var currentWord = vocabularyList.randomElement()!
    
    @State var answerGiven = ""
    
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
            }
            // List of past questions
            Text ("History")
        }
        .frame(width: 800, height: 400)
    }
}

#Preview {
    QuizView()
}
