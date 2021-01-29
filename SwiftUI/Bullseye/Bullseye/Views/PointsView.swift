//
//  PointsView.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 26.01.2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    
    var body: some View {
        let roundedValue : Int = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10){
            InstructionText(text: "The Slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) Points\n 🎉🎉🎉")
            Button(action: {
                withAnimation{
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }, label: {
                ButtonText(text: "Start New Round")
            })
        }
        .padding()
        .frame(maxWidth:300)
        .background(Color("BackGroundColor"))
        .cornerRadius(Constants.General.roundRectCornerRadius)
        //shadow options
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
        //adding animation
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisible: self.alertIsVisible, sliderValue:  self.sliderValue, game:  self.game)
            .environment(\.sizeCategory, .extraLarge)
        PointsView(alertIsVisible: self.alertIsVisible, sliderValue:  self.sliderValue, game:  self.game).previewLayout(.fixed(width: 568, height: 320))
        //cцены для dark-mode
        PointsView(alertIsVisible: self.alertIsVisible, sliderValue:  self.sliderValue, game:  self.game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        PointsView(alertIsVisible: self.alertIsVisible, sliderValue:  self.sliderValue, game:  self.game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
