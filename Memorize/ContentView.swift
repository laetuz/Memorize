//
//  ContentView.swift
//  Memorize
//
//  Created by Ryo Martin on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    //Making arraays
    let emojis = ["💀", "🗿", "🦈", "👽"]
    
    var body: some View {
        HStack {
            //Making ForEach
            ForEach(0..<4, id: \.self){ num in
                CardViewCustom(content: emojis[num])
            }
            
        }.foregroundColor(.blue).padding()
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct CardViewCustom: View {
    @State var isFaceUp = false
    var content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                base
            }
        }
        .onTapGesture {
            //toggle is the same as isFaceUp = !isFaceUp
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
