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
    @State private var starterCars = StarterCars()
    @State private var selectedCar : Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var BrakesPackage = false
    @State private var SlipstreamedBodyPackage = false
    @State private var SupersonicWindscreeenWipersPackage = false
    @State private var remainingFunds = 1000
    
    var body: some View {
        //exhaust
        let exhaustPackageBinding = Binding<Bool> (
            get: {self.exhaustPackage},
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].acceleration -= 2
                    remainingFunds -= 100
                } else {
                    starterCars.cars[selectedCar].acceleration += 2
                    remainingFunds += 100
                }
            }
        )
        //tires
        let tiresPackageBinding = Binding<Bool> (
            get: {self.tiresPackage},
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 100
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 100
                }
            }
        )
        //brakes
        let BrakesPackageBinding = Binding<Bool> (
            get: {self.BrakesPackage},
            set: { newValue in
                self.BrakesPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 100
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 100
                }
            }
        )
        //slipstreamed body
        let SlipstreamedBodyPackageBinding = Binding<Bool> (
            get: {self.SlipstreamedBodyPackage},
            set: { newValue in
                self.SlipstreamedBodyPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].topSpeed += 20
                    remainingFunds -= 300
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 20
                    remainingFunds += 300
                }
            }
        )
        //supersonic windscreen wipers
        let SupersonicWindscreeenWipersPackageBinding = Binding<Bool> (
            get: {self.SupersonicWindscreeenWipersPackage},
            set: { newValue in
                self.SupersonicWindscreeenWipersPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].topSpeed += 400
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 400
                    remainingFunds += 1000
                }
            }
        )
        
        Form{
            VStack {
                Text("\(starterCars.cars[selectedCar].displayStats())")
                    .font(.callout)
                    .padding()
                    .frame(width: 300)
                HStack{
                    Button("Next car", action: {
                        if selectedCar < self.starterCars.cars.count - 1{
                            selectedCar += 1}
                        else{
                            selectedCar = 0}
                    })
                        .padding()
                }
            }
            Section {
                Toggle("Exhaust Package (cost 100)", isOn: exhaustPackageBinding)
                Toggle("Tires Package (cost 100)", isOn: tiresPackageBinding)
                Toggle("Brakes Package (cost 100)", isOn: BrakesPackageBinding)
                Toggle("Slipstreamed Body Package (cost 300)", isOn: SlipstreamedBodyPackageBinding)
                Toggle("Supersonic Windscreeen Wipers Package (cost 1000)", isOn: SupersonicWindscreeenWipersPackageBinding)
            }
        }
        Spacer()
        Text("Remaining Funds: \(remainingFunds)")
            .baselineOffset(20)
            .foregroundColor(.red)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
