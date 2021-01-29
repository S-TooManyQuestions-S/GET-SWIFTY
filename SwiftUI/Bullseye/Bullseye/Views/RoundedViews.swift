//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 24.01.2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    //name of a SF-symbol
    var systemName : String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundRectViewHeight)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedImageViewFilled: View {
    //name of a SF-symbol
    var systemName : String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundRectViewHeight)
            //если мы хотим поместить элементы на задний фон
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct PreviewView:View{
    var body: some View {
        VStack(spacing: 10){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "99")
            RoundedTextView(text: "22")
        }
    }
}

struct RoundedRectTextView : View{
    var text : String
    var body : some View{
        Text(text.uppercased())
            .bold()
            .kerning(-0.2)
            .multilineTextAlignment(.center)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay(RoundedRectangle(cornerRadius: 20.0)
                        .strokeBorder(Color("ButtonStrokeColor"),
                                      lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedTextView : View{
    var text : String
    var body: some View{
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundViewLength, height: Constants.General.roundRectViewHeight)
            .overlay(Circle()
                        .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth))
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
