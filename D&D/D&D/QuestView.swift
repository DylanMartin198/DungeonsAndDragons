//
//  QuestView.swift
//  D&D
//
//  Created by Dylan Martin on 3/9/23.
//

import SwiftUI
import OpenAISwift

struct QuestionAndAnwer: Identifiable {
    let id = UUID()
    
    let question: String
    let answer: String
}

struct QuestView: View {
    
    let openAI = OpenAISwift(authToken: "apikey")
    
    @State private var search: String = ""
    @State private var questionAndAnswers: [QuestionAndAnwer] = []
    @State private var searching: Bool = false
    
    @State private var navigateToHelpView: Bool = false
    
    private func performOpenAISearch() {
        openAI.sendCompletion(with: search, maxTokens: 50) { result in
            switch result {
            case .success(let success):
                
                let questionAndAnwer = QuestionAndAnwer(question: search, answer: success.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                
                questionAndAnswers.append(questionAndAnwer)
                search = ""
                searching = false
                
            case .failure(let failure):
                print(failure.localizedDescription)
                searching = false
            }
        }
    }
    
    var body: some View {
        HStack {
            TextField("Take Me On A D&D Adventure!", text: $search)
                .onSubmit {
                    if !search.isEmpty {
                        searching = true
                        performOpenAISearch()
                    }
                }
                .padding()
                .foregroundColor(.black)

            Spacer()

            Button(action: {
                self.navigateToHelpView = true
            }) {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: self.$navigateToHelpView, content: {
                HelpView()
            })
            .padding(.trailing, 10)
        }
            
            Divider()
            
            if searching {
                ProgressView()
                    .padding()
            }
            
            ScrollView(showsIndicators: false) {
                ForEach(questionAndAnswers) { qa in
                    VStack(spacing: 10) {
                        Text(qa.question)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Text(qa.answer)
                        .padding([.bottom], 10)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.black)
            }
            
            Spacer()
        }
    }

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
