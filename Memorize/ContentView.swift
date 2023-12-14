//
//  ContentView.swift
//  Memorize
//
//  Created by Ryo Martin on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardViewCustom(isFaceUp: true)
            CardViewCustom()
            CardViewCustom()
            CardViewCustom()
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
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("Hello")
            } else {
                base
            }
        }
        .onTapGesture {
           isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
