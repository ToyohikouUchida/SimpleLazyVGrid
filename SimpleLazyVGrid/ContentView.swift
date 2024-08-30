//
//  ContentView.swift
//  SimpleLazyVGrid
//
//  Created by 内田豊彦 on 2024/08/30.
//

import SwiftUI

struct ContentView: View {
    let symbols = [
        "pencil",
        "pencil.circle",
        "pencil.circle.fill",
        "pencil.slash",
        "square.and.pencil",
        "rectangle.and.pencil.and.ellipsis",
        "highlighter",
        "pencil.and.outline",
        "pencil.tip",
        "pencil.tip.crop.circle",
        "pencil.tip.crop.circle.badge.plus",
        "pencil.tip.crop.circle.badge.minus",
        "pencil.tip.crop.circle.badge.arrow.forward",
        "lasso",
        "lasso.and.sparkles",
        "trash",
        "trash.fill",
        "trash.circle",
        "trash.circle.fill",
        "trash.square",
        "trash.square.fill",
        "trash.slash"
    ]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(symbols, id: \.self) { symbol in
                        NavigationLink(destination: DetailView(symbol: symbol)){
                            Image(systemName: symbol)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(20)
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct DetailView: View {   //遷移先View
    let symbol: String
    
    var body: some View {
        VStack {
            Image(systemName: symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            Text("This is the detail view for \(symbol)")
                .font(.headline)
                .padding()
        }
        .navigationTitle(symbol)
    }
}


#Preview {
    ContentView()
}
