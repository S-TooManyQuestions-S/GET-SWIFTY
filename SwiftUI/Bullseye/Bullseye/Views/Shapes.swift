//
//  Shapes.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 24.01.2021.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    var body: some View {
        VStack{
            if !wideShapes{
            Circle()
                //.fill(Color.blue)
//                .inset(by: 10.0)
//                .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 20.0)
                //you can use stroke border instead
                .strokeBorder(Color.blue, lineWidth: 20.0, antialiased: true)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //adding some animation to our rectangle
                    .transition(.opacity)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Button(action: {
                //toggle sets the value of the bool variable to the opposite one
                withAnimation{
                    wideShapes.toggle()
                }
            }){
                Text("Animate!")
            }
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
