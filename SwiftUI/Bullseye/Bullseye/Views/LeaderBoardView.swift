//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 26.01.2021.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing:Bool
    @Binding var game : Game

    var body: some View {
        ZStack {
            Color("BackGroundColor")
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView{
                VStack (spacing: 10){
                    HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                    LabelView()
                    //indexes in an array, where i is iterable value
                    ForEach(game.leaderboardEntries.indices){ i in
                        let leaderBoardEntry = game.leaderboardEntries[i]
                        RowView(index: i, score: leaderBoardEntry.score, date: leaderBoardEntry.date)
                    }
                    
                }
            }
        }
        
    }
}

struct RowView: View {
    let index : Int
    let score : Int
    let date  : Date
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth))
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
        
        
    }
}

struct HeaderView : View{
    @Binding var leaderBoardIsShowing:Bool
    //detects whever is it regular amount of space for a layout or you are currently have compact amount of space
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body : some View{
        ZStack {
            //we want this centered
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                }else{
                    BigBoldText(text: "Leaderboard")
                }
            }
            .padding(.top)
            HStack{
                Spacer()
                Button(action: {
                    leaderBoardIsShowing = false
                }, label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                })
               
            }
        }
    }
}

struct LabelView : View{
    var body: some View{
        HStack{
            //you can specify the spce width
            Spacer()
                .frame(width: Constants.General.roundViewLength)
            Spacer()
            LabelTextView(text: "Score")
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidth)
            Spacer()
            LabelTextView(text: "Date")
                .frame(width: Constants.LeaderBoard
                        .leaderBoardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderboardIsShowing, game: game)
            .environment(\.sizeCategory, .extraLarge)
        LeaderBoardView(leaderBoardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
        //cцены для dark-mode
        LeaderBoardView(leaderBoardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        LeaderBoardView(leaderBoardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
