//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jamie Thomson on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        VStack() {
            Text("Welcome to your car game selector thing")
                .bold()
                .font(.largeTitle)
                .fontWeight(.bold)
                //.alignmentGuide(.leading) { d in d[.leading]}
                .foregroundColor(Color.pink)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding()
            NavigationLink(destination: FirstView(), label:{
                Text("click to continue")
                    .underline()
                    .font(.callout)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.center)
            })
        }
        
        }
    }
}

struct FirstView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        Text("Car Make: \(car.make)\nModel:\(car.model)\nTop Speed:\(car.topSpeed)\nAcceleration(0-60mph)\(car.acceleration)s\nhandling:\(car.handling)")
            .font(.callout)
            .padding()
            .frame(width: 300)
            .offset(y: -290)
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
