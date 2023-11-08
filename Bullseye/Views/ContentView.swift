//
//  ContentView.swift
//  Bullseye
//
//  Created by Alaa Husseiny on 08/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var whosThereIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    var body: some View {
        VStack{
            
            Text("🎯🎯🎯\n PUT THE BULLSEYE AS CLOSE AS POSSIBLE TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
                        
            Text(String(game.target))
                .kerning(-1.0)
                .fontWeight(.black)
                .font(.largeTitle)
            
            HStack{
                
                Text("1")
                    .bold()
                Slider(value: 
                        $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }.padding(10)
            
            Button(action:
                    {
                alertIsVisible = true
            }){
                Text("Calculate!")
            }
            
            .alert("Hello there!", isPresented: $alertIsVisible) {
                Button("Awesome!") { }
            } message: {
                let roundedSliderValue = Int (sliderValue.rounded())
                Text("This is the silder value : \(roundedSliderValue).\n You scored \(game.points(sliderValue:roundedSliderValue)) points this round."
                )
            }
            
        }
    }

}
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View{
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}

