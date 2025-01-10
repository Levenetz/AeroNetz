//
//  HomeView.swift
//  AeroNetz
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var activeView: activeViewEnum
    
    var body: some View {
        VStack{
            HStack {
                airplaneIcon
                titleHome
            }
            buttonFlightsView
        }
    }
}

//MARK: Components

extension HomeView{
    
    //MARK: Title Home
    var titleHome: some View{
        Text("AeroNetz ")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
    }
    
    //MARK: Icon
    var airplaneIcon: some View{
        Image("airplaneIcon")
            .resizable()
            .frame(width: 50, height: 50)
            .padding(15)
        
    }
    
    //MARK: Change View Button
    var buttonFlightsView: some View{
        Button{
            activeView = .flightHistoryView
        }label: {
            Text("Histórico de Voos")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding(30)
        
    }
}
