//
//  ContentView.swift
//  05_WordScramble
//
//  Created by Austin Roach on 2/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
<<<<<<< Updated upstream
        Text("Hello, world!")
            .padding()
=======
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(rootWord)
        }
>>>>>>> Stashed changes
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
