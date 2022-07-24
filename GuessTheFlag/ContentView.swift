//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Niezwan Abdul Wahid on 24/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPopupShown = false;
    @State private var popupTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var totalScore = 0;
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of").foregroundColor(.white).font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer]).foregroundColor(.white).font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3){ number in
                        Button {
                            //handle click later
                            onFlagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                        
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(totalScore)").font(.largeTitle.bold())
                    .foregroundColor(.white)
            }.padding()
        }
        .alert(popupTitle, isPresented: $isPopupShown){
            Button("Continue", action: resetQuestion)
        } message: {
            Text("Your score is \(totalScore)")
        }
    }
    
    func onFlagTapped(_ number: Int){
        if number == correctAnswer {
            popupTitle = "Correct"
            totalScore += 1
        }else {
            popupTitle = "False"
        }
        
//        isPopupShown = true
        resetQuestion()
    }
    
    func resetQuestion(){
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
