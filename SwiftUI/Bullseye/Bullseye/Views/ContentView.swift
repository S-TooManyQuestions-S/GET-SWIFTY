//
//  ContentView.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 14.01.2021.
//

//Give each class or struct, that you create a single responsibility

import SwiftUI

struct ContentView: View {
    //body and a state variable are always in synch - @State
    //anytime a state variable changes SwiftUI will automatically recompute the body of the view, so the body is always up-to-date with the state
    //we are also using type inference so there is no need to type :Int or :Game
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        //создан, чтобы помещать что то на передний/задний фон, а также
        //комбинировать элементы интерфейса
        ZStack {
            //hardcode or use xassets catalog
//            Color(red: 243.0/255.0, green: 248.0/255.0, blue: 253/255.0)
//                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            BackgroundView(game: $game)
            //vertical stack
            VStack {
                //passing binding variable
                    InstructionsView(game: $game)
                        .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible{
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }else{
                    HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible{
                //whenever you put a view inside a ZStack it centers that view within the Zstack
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
            
        }
    }
}

struct InstructionsView : View{
    //binding a value to a @State value
    @Binding var game : Game
    var body : some View{
        VStack{
            InstructionText(text: "🎯🎯🎯\nPut the bulls eye as close as you can to")
                //specific instructions
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView : View{
    @Binding var sliderValue : Double
    var body : some View{
        //horizontal stack
        HStack {
            SliderLabelText(text: "1")
            //bind a slider view to a state variable
            Slider(value: $sliderValue, in:
                    1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButtonView : View{
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    var body : some View{
        Button(action: {
            //using print for debugging
            //print("Hello, Swift UI!")
            withAnimation{
                self.alertIsVisible = true
            }
        }) {
            //transform into uppercase
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
            
        }
        //расширяем границы кнопки (перед .background() - важно)
        .padding(20)
        //смена цвета заднего фона
        .background(
            ZStack {
                Color("ButtonColor")
                //настройка градиента
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        //смена цвета текста
        .foregroundColor(Color.white)
        //округление углов
        .cornerRadius(Constants.General.roundRectCornerRadius)
        //overlay - view that gets drawn on top of everything else
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        //showing an alert
        //binding a state variable
        /*
        .alert(isPresented: $alertIsVisible, content: {
            //round a value
            let roundedValue: Int = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(
                //there is also no need to type self.
                title: Text("Hello there <3"),
                message: Text("The slider value is \(roundedValue).\n" + "You scored \(points) points this round!"),
                dismissButton: .default(Text("Awesome")){
                    game.startNewRound(points: points)
                }
            )
        })*/
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraLarge)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        //cцены для dark-mode
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
