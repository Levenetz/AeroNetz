//
//  ContentView.swift
//  AeroNetz
//
//  Created by Victor Levenetz Mariano on 05/10/24.
//

import SwiftUI

struct ContentView: View {
    //MARK: Variable view management
    @State var activeView: activeViewEnum = .homeView
    
    var body: some View {
        //Switch to change the view
        switch activeView {
        case .homeView:
            AnyView(HomeView(activeView: $activeView))
        case .flightHistoryView:
            AnyView(FlightHistoryView(activeView: $activeView))
        }
    }
}


//MARK: View enum
enum activeViewEnum{
    case flightHistoryView
    case homeView
}


#Preview {
    ContentView()
}
