//
//  QuestView.swift
//  D&D
//
//  Created by Dylan Martin on 3/9/23.
//

import SwiftUI

struct QuestView: View {
    
    @State private var question = ""
    @State private var response = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    TextField("Ask To Go On A D&D Journey!", text: $question, onCommit: {
                        // fetchResponse()
                    })
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: 300, maxHeight: 75)
                    .textFieldStyle(PlainTextFieldStyle())
                    .lineLimit(nil)
                    .truncationMode(.head)
                }
                Divider()
                
                Text(response)
                    .padding()
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // handle help icon button tapped
                    }) {
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                }
                Spacer()
            }
        }
    }
}

struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
