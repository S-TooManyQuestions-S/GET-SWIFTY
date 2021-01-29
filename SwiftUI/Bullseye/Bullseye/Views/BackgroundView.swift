//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 24.01.2021.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var game : Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
        
    }
}

struct TopView: View {
    
    @Binding var game : Game
    @State private var leaderboardIsShowing = false
    var body: some View {
        HStack(spacing: 10){
            Button(action: {game.restart()}, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            //extends to use as much space as available
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }){
                RoundedImageViewFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing, content: {
                LeaderBoardView(leaderBoardIsShowing: $leaderboardIsShowing, game: $game)
            })
            
        }
    }
}

struct NumberView : View{
    var title : String
    var text : String
    
    var body : some View{
        VStack(spacing: 5){
            LabelTextView(text: title)
            RoundedRectTextView(text: self.text)
                
        }
    }
}


struct BottomView: View {
    
    @Binding var game : Game
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView : View{
    //Environment property that shows us whether is the app in dark mode or not
    @Environment(\.colorScheme) var colorScheme
    var body : some View{
        ZStack{
            Color("BackGroundColor")
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //ring is the value, that we are currently in
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    //you can use fill instead
                    .strokeBorder(RadialGradient(
                                    gradient: Gradient(colors: [Color("CircleColor").opacity(0.8*opacity), Color("CircleColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300),lineWidth: 20.0)
                    .frame(width: size, height: size)
            }
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
