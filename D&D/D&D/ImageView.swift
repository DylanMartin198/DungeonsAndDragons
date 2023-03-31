//
//  ImageView.swift
//  D&D
//
//  Created by Dylan Martin on 3/29/23.
//

import OpenAIKit
import SwiftUI

final class ViewModel: ObservableObject {
    private var openai: OpenAI?
    
    func setup() {
        openai = OpenAI(Configuration(organizationId: "Personal", apiKey: "sk-apikey"))
    }
    
    func generateImage(prompt: String) async -> UIImage? {
        guard let openai = openai else {
            return nil
        }
        do {
            let params = ImageParameters(prompt: prompt, resolution: .medium, responseFormat: .base64Json)
            let result = try await openai.createImage(parameters: params)
            let data = result.data[0].image
            let image = try openai.decodeBase64Image(data)
            return image
        }
        catch {
            print(String(describing: error))
            return nil
        }
    }
}

struct ImageView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var image: UIImage?
    @State private var searching: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 350)
                            .scaledToFit()
                    } else {
                        Text("Type prompt to generate image!")
                    }
                    Spacer()
                    Divider()
                    TextField("Type prompt here...", text: $text)
                        .padding()
                        .foregroundColor(.black)
                        .onSubmit {
                        if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                            Task {
                                searching = true
                                let result = await viewModel.generateImage(prompt: text)
                                searching = false
                                if result == nil {
                                    print("Failed to get image")
                                }
                                self.image = result
                            }
                        }
                    }
                }
                if searching {
                    ProgressView()
                        .padding()
                }
            }
            .navigationTitle("Image Generator")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.blue)
                            .imageScale(.large)
                    }
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back")
                            .foregroundColor(.blue)
                    }
                }
            )
            .onAppear {
                viewModel.setup()
            }
            .padding()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
