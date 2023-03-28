//
//  InstructionsView.swift
//  D&D
//
//  Created by Dylan Martin on 3/20/23.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        Text("Basic Instructions")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
        Divider()
        VStack {
            Text("To get started if you have a specific adventure in mind, type in the specific setting you would like. And if you are looking for some ideas just look at the suggested headers found in the tip section!")
        }
        .padding(10)
        .foregroundColor(.black)
        Spacer()
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
