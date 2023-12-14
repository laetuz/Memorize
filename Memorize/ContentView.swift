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
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("Hello")
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}

#Preview {
    ContentView()
}
