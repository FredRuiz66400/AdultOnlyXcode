//
//  FinalView.swift
//  Adult Only
//
//  Created by macbook on 23/10/2024.
//

import SwiftUI
import MapKit

struct FinalView: View {
    var option: Option
    
    @StateObject private var locationManager = LocationManager()
    @State private var searchText = ""
    
    var body: some View {
        
            VStack(spacing:60) {
                Text("")
                    .font( .largeTitle)
                    .padding(.top)
                
                Image(option.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .padding()
                
                Map(coordinateRegion: $locationManager.region)
                    .frame(height: 300)
                    .cornerRadius(20)
                
                VStack(spacing: 10) {
                    HStack {
                        TextField("rechercher un lieu", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                        
                        Button(action: {
                            searchForLocation()
                        }) {
                            Text("Rechercher")
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    Button(action: {
                        locationManager.startUpdatingLocation()
                    }) {
                        Text("Apartir de ma position")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                
                
                Button(action: {
                    print("Ajoute un lieu selectionne")
                }) {
                    
        
                        Text("Ajouter un lieu")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    
                }
                    
                    .padding(.bottom)
                }
                .navigationTitle("detail de l'option")
                .padding()
            }
            
            private func searchForLocation() {
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = searchText
                let search = MKLocalSearch(request: searchRequest)
                
                search.start { response, error in
                    guard let response = response, let mapItem = response.mapItems.first else {
                        print("Aucun resultat trouve")
                        return
                    }
                    let coordinate = mapItem.placemark.coordinate
                    locationManager.region = MKCoordinateRegion(
                        center: coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                }
            }
}
    
    
    
    
    
    
    struct FinalView_Previews: PreviewProvider {
        static var previews: some View {
            FinalView(option: Option(imageName: "photo1", title: "Option 1"))
        }
    }

