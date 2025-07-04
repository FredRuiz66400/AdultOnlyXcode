//
//  AddPlaceView.swift
//  Adult Only
//
//  Created by macbook on 26/10/2024.
//

import SwiftUI

struct AddPlaceView: View {
    var option: Option
    
    @State private var placeName = ""
    @State private var description = ""
    @State private var latitude = ""
    @State private var longitude = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details du lieu")) {
                    TextField("Nom du lieu", text: $placeName)
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Coordonnees")) {
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button(action: {
                        addPlace()
                    }) {
                        Text("Ajouter un lieu")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Ajouter un lieu")
        }
    }
    private func addPlace() {
        print("Lieu ajoute : \(placeName) - \(description)")
    }
}

struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView(option: Option(imageName:"photo1", title:"Option 1"))
    }
}
