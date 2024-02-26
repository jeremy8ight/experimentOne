//
//  ContentView.swift
//  assignmentOne
//
//  Created by Jeremy Barnes-Smith on 2/25/24.
//

import SwiftUI

var emojisTheme1 = ["🚫", "🚫", "⛔️", "⛔️", "🚦", "🚦", "🚔", "🚔", "🛑", "🛑"]
var emojisTheme2 = ["🦁", "🦁", "🦊", "🦊", "🐼", "🐼", "🦬", "🦬", "🐴", "🐴"]
var emojisTheme3 = ["👕", "👕", "👚", "👚", "👖", "👖", "🩴", "🩴", "🧦", "🧦"]

var totalNumOfCards = 10

struct ContentView: View {
    
    @State var theme: String = "theme1"
    
    var body: some View {
        VStack () {
            Text("Memorize!").font(.largeTitle)
            Spacer()
            LazyVGrid(columns: [GridItem(.adaptive(minimum:60))]) {
                if theme == "theme1" {
                    ForEach(0..<totalNumOfCards, id: \.self) {index in
                        MemorizeCardView(name:emojisTheme1[index], cardColor: .red)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                } else if theme == "theme2" {
                    ForEach(0..<totalNumOfCards, id: \.self) {index in
                        MemorizeCardView(name:emojisTheme2[index], cardColor: .green)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                } else if theme == "theme3" {
                    ForEach(0..<totalNumOfCards, id: \.self) {index in
                        MemorizeCardView(name:emojisTheme3[index], cardColor: .orange)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                }
            }
            Spacer()
            memorizeCardButtons
        }
        .padding()
    }
    
    func cardButton(themeSelection: String, imageName: String, iconName: String) -> some View {
        VStack {
            Button(action: {
                if themeSelection == "theme1" {
                    emojisTheme1.shuffle()
                } else if themeSelection == "theme2" {
                    emojisTheme2.shuffle()
                } else if themeSelection == "theme3" {
                    emojisTheme3.shuffle()
                }
                theme = themeSelection
            }, label: {
                Image(systemName: imageName)
                    .font(.title)
            })
            Text(iconName)
        }
        .padding()
    }
    
    var memorizeCardButtons: some View {
        HStack (alignment: .bottom) {
            cardButton(themeSelection: "theme1", imageName: "car", iconName: "Traffic")
            cardButton(themeSelection: "theme2", imageName: "fish", iconName: "Animals")
            cardButton(themeSelection: "theme3", imageName: "hanger", iconName: "Apparel")
        }
        .foregroundColor(.blue)
    }
}

struct MemorizeCardView: View {
    let name: String
    let cardColor: Color
    @State var isFaceUp: Bool = false
    
    var body: some View {
        let rect = RoundedRectangle(cornerRadius: 12)
        ZStack {
            rect.fill( isFaceUp ? .white : cardColor)
            Text(name).font(.largeTitle).opacity(isFaceUp ? 1 : 0)
            rect.strokeBorder(lineWidth: 2)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
