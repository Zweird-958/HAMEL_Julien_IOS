//
//  QuestionsView.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct QuestionsView: View {
    let questionsModel = Model()
    @State var currentQuestion = 0
    @State var choice: Int = 0
    @State var correctAnswers = 0
    @EnvironmentObject var navigationModel: NavigationModel
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        let questions = questionsModel.questions
        let question = questions[currentQuestion]
        Text(question.statement)
        
        ForEach( question.proposal, id: \.self) { proposal in
            let index = question.proposal.firstIndex(of: proposal)
            Button(action: {
                if index != nil {
                    choice = index!
                }
            }){
                HStack{
                    Image(systemName: index == choice ? "circle.fill" : "circle")
                        .foregroundColor(.blue)
                    Text(proposal)
                        .foregroundColor(.black)
                }
            }
        }.padding()
        

        Button(action:validateAnswer) {
            Text("Suivant")
        }
        
        SignOut()
    }
    
    func validateAnswer(){
        let questions = questionsModel.questions
        let question = questions[currentQuestion]
        
        if question.answer.rawValue == choice + 1 {
            correctAnswers += 1
        }
        
        if currentQuestion == questions.count - 1 {
            userModel.saveMark(mark: Int16(correctAnswers))
            navigationModel.path.append("mark")
            
            return
        }
        
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
        }

            
        choice = 0

        
        
    }
}

#Preview {
    QuestionsView()
}
