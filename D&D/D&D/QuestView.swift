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
    
    let openAI = OpenAISwift(authToken: "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")
    
    @State private var search: String = ""
    @State private var questionAndAnswers: [QuestionAndAnwer] = []
    @State private var searching: Bool = false
    
    @State private var navigateToHelpView: Bool = false
    
    private func performOpenAISearch() {
        openAI.sendCompletion(with: search) { result in
            switch result {
            case .success(let success):
                
                let questionAndAnwer = QuestionAndAnwer(question: search, answer: success.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
                
                questionAndAnswers.append(questionAndAnwer)
                search = ""
                searching = false
                print(questionAndAnwer)
                
            case .failure(let failure):
                print(failure.localizedDescription)
                searching = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TextField("Ask To Go On A D&D Journey!", text: $search)
                .onSubmit {
                    if !search.isEmpty {
                        searching = true
                        performOpenAISearch()
                    }
                }
                .padding()
                .foregroundColor(.black)
            
            if searching {
                ProgressView()
                    .padding()
            }
            
            ScrollView(showsIndicators: false) {
                ForEach(questionAndAnswers) { qa in
                    VStack(spacing: 10) {
                        Text(qa.question)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    Text(qa.answer)
                        .padding([.bottom], 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .foregroundColor(.black)
            }
            
            Spacer()
        }
    }
}

//HStack {
//    Spacer()
//    Button(action: {
//        self.navigateToHelpView = true
//    }) {
//        Image(systemName: "questionmark.circle")
//            .font(.system(size: 20))
//            .foregroundColor(.blue)
//    }.sheet(isPresented: self.$navigateToHelpView, content: {
//        HelpView()
//    })
//    .padding(.trailing, 16)
//    .padding(.top, 12)
//}
//.padding(.trailing, 16)
//.padding(.top, 12)

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
