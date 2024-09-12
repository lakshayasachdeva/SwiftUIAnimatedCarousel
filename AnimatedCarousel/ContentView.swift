//
//  ContentView.swift
//  AnimatedCarousel
//
//  Created by Lakshaya Sachdeva on 12/09/24.
//

import SwiftUI

struct ContentView: View {
    let images = ["image1", "image2", "image3", "image4"]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        .containerRelativeFrame(.horizontal)
                    // New api given by apple in ios17+
                    // takes a closure with 2 params
                    // content => content of the scrollview
                    // phase => if identity means it is in view right now..
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect(
                                    x: phase == .identity ? 1 : 0.8,
                                    y: phase == .identity ? 1 : 0.8
                                )
                                .offset(y: phase == .identity ? 0 : 240)
                        }
                }
            }
        }
        . contentMargins(.horizontal, 20.0)
    }
}

#Preview {
    ContentView()
}
