//
//  ContentView.swift
//  Memorize
//
//  Created by Ryo Martin on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    //Making arraays
    let emojis = ["💀", "🗿", "🦈", "👽", "💀", "🗿", "🦈", "👽"]
    @State var cardCounts = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards()
            }
            Spacer()
            HStack {
                if cardCounts > 0 {
                    Button(action: decreaseCardCount, label: {
                        Image(systemName: "minus")
                    })
                    Spacer()
                    moreButton(title: "plus")
                } else {
                    moreButton(title: "plus.circle").font(.largeTitle)
                }
            }
        }
        .padding()
    }
    
    private func cards() -> some View {
        HStack {
            //Making ForEach
            LazyVGrid(
                //columns: [GridItem(), GridItem(), GridItem()]
                columns: [GridItem(.adaptive(minimum: 120))]
            ) {
                ForEach(0..<cardCounts, id: \.self){ num in
                    CardViewCustom(
                        content: emojis[num])
                    .font(.largeTitle)
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }
            }
        }.foregroundColor(.blue).padding()
    }
    
    private func decreaseCardCount() {
        cardCounts = max(cardCounts - 1, 0)
    }

    private func increaseCardCount() {
        cardCounts = min(cardCounts + 1, emojis.count)
    }
    
    private func moreButton(title: String) -> some View{
        Button(action: increaseCardCount, label: {
            Image(systemName: title)
        })
    }
}

struct CardViewCustom: View {
    @State var isFaceUp = false
    var content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            /****used to be like this:*
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            } else {
                base
            }
             */
            
        //The new approach/best approach is to add group (a ForEach of one)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
            }//.opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
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
