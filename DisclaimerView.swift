//
//  DisclaimerView.swift
//  Adult Only
//
//  Created by macbook on 22/10/2024.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        
            
            VStack(spacing: 20) {
                Text("Bienvenue , vous trouverez ici tous les lieus Adult Only,Bars,Restaurants et Hotels , les meilleurs endroits pour acheter et profiter d'un bon cigare ,et les meilleures endroits pour profitez d'un bon alcool entre amis,et bien d'autres choses encores....")
                    .font(Font.custom("helvetica Neue", size: 30))
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: AuthenticationView()) {
                    Text("Entrer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }



struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
