//
//  SplashScreenView.swift
//  Adult Only
//
//  Created by macbook on 22/10/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 1.0
    
    var body: some View {
        
        ZStack {
            Color.purple
                .ignoresSafeArea()
            
            if isActive {
                DisclaimerView()
            } else {
                
                VStack {
        
                    VStack {
                        
                        Image("Logo1")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .foregroundColor(.yellow)
                    }
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeOut(duration: 10.0)) {
                            opacity = 0.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
                            isActive = true
                        }
                    }
                }
            }
        }
        .background(Color.purple)
        .ignoresSafeArea()
    
            }
        }
        
    
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }

