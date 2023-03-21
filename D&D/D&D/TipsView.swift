//
//  TipsView.swift
//  D&D
//
//  Created by Dylan Martin on 3/20/23.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        List {
            VStack {
                Text("Tip one")
                Text("Tip two")
                Text("Tip three")
            }
        }
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
