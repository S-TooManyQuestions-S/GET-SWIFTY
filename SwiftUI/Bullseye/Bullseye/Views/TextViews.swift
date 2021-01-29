//
//  TextViews.swift
//  Bullseye
//
//  Created by Андрей Самаренко on 24.01.2021.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            //текст имеет формат "жирный"
            .bold()//->text
            //расстояние между символами
            .kerning(2.0)//->text
            //выравнивание по центру
            .multilineTextAlignment(.center)//-> some View
            //расстояние между линиями с текстом
            .lineSpacing(4.0)
            //динамический тип (зависит от того, какой размер текста пользователь выбрал в настройках)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText : View{
    var text:String
    var body : some View{
        Text(text)
             .kerning(-1.0)
             .font(.largeTitle)
             //насыщенность шрифта
             .fontWeight(.black)
    }
}

struct SliderLabelText : View{
    var text : String
    var body : some View{
        Text(text)
            .bold()
            .font(.body)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelTextView : View{
    var text: String
    var body : some View{
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .multilineTextAlignment(.center)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            
    }
}

struct BodyText : View{
    var text: String
    var body : some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            //.padding(.top, 5)
            
    }
}

struct ButtonText : View{
    var text: String
    var body : some View{
        Text(text)
            .bold()
            .padding()
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12.0)
            
    }
}

struct ScoreText : View{
    var score: Int
    var body : some View{
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText : View{
    var date: Date
    var body : some View{
        //specified style
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText : View{
    let text : String
    var body : some View{
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
    }
}



struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelTextView(text: "score")
            RoundedRectTextView(text: "999")
            BodyText(text: "You scored 200 Points\n 🎉🎉🎉")
            ButtonText(text: "Start new round")
                .padding()
            ScoreText(score: 12)
            DateText(date: Date())
            BigBoldText(text: "Some")
        }
    }
}
