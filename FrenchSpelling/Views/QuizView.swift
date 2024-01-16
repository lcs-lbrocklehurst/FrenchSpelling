//
//  QuizView.swift
//  FrenchSpelling
//
//  Created by Lewis Brocklehurst on 2024-01-15.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        HStack {
            //Quiz Interface
            VStack {
                HStack {
                    Spacer()
                    Text("Banana")
                        .font(.custom( "Helvetica", size: 96.0))
                }
                
                
                Divider()
                
                
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
