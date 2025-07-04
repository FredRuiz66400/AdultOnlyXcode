//
//  AuthenticationView.swift
//  Adult Only
//
//  Created by macbook on 22/10/2024.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    @State private var email = ""
    @State private var showAccessDenied = false
    @State private var isAuthenticated = false
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                Text("Authentification")
                    .font(.title)
                
                TextField("Prenom", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Nom", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                DatePicker("Date de naissance", selection: $birthDate, displayedComponents: .date)
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Valider") {
                    if isOfLegalAge(birthDate) {
                        isAuthenticated = true
                        
                    } else {
                        showAccessDenied = true
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                
                .alert(isPresented: $showAccessDenied) {
                    Alert(
                        title: Text("Acces refuse"),
                        message: Text("Vous devez etre majeurs pour acceder a l'appli."),
                        dismissButton: .default(Text("Retour"))
                        
                        
                    )
                }
                
                NavigationLink(
                    destination: OptionsCarouselView(),
                    isActive: $isAuthenticated
                ) {
                    EmptyView()
                }
            }
            .padding()
        }
    }
                    }
    func isOfLegalAge(_ birthDate: Date) -> Bool {
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: Date())
        let age = ageComponents.year ?? 0
        return age >= 18
    }

                    

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
