import SwiftUI

struct FlightHistoryView: View {
    //Change view var
    @Binding var activeView: activeViewEnum
    
    //Principal instance of VM
    @StateObject private var flightViewModelVar = FlightsViewModel()
    
    //ID searching
    @State var searchTerm = ""
    
    var body: some View {
        NavigationView {
            VStack {
                pickerList
                searchBar
                flightList
            }
        }
    }
}

//MARK: Components

extension FlightHistoryView {
    //MARK: PickerFilter
    var pickerList: some View {
        Picker("Select Status", selection: $flightViewModelVar.selectedStatus) {
            Text("Todos").tag("All")
            Text("Concluídos").tag("Completed")
            Text("Cancelados").tag("Canceled")
            Text("Agora").tag("Now")
            Text("Futuros").tag("Future")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    //MARK: Search Bar
    var searchBar: some View {
        TextField("Pesquisar por ID", text: $searchTerm)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding()
    }

    //MARK: LIST
    var flightList: some View {
        ScrollView {
            LazyVStack(spacing: 5) { // 5p Itens spacing
                ForEach(filteredFlights) { flight in
                    VStack {
                        HStack {
                            Text(" id: \(flight.flightId)")
                                .foregroundColor(.gray)
                                .ignoresSafeArea()
                            
                            Spacer()
                            //MARK: Colored String Status
                            Text(flightViewModelVar.stringForStatus(status: flight))
                                .font(.subheadline)
                                .frame(width: 100,height: 20)
                                .background(flightViewModelVar.colorForStatus(status: flight))
                                .cornerRadius(10)
                        }
                        HStack {
                            //MARK: Date and Time
                            Text("\(flightViewModelVar.formatDate(flight.departureTime))-\(flightViewModelVar.formatTime(flight.arrivalTime))")
                                .font(.footnote)
                                .foregroundColor(Color("timeColor"))
                                .lineLimit(1)
                            
                            Spacer()
                            
                            //MARK: Colored String Completion Status
                            Text(flightViewModelVar.stringForCompletionStatus(status: flight))
                                .font(.subheadline)
                                .frame(width: 100,height: 20)
                                .background(flightViewModelVar.colorForCompletionStatus(status: flight))
                                .cornerRadius(10)
                        }
                        HStack {
                            //MARK: Arrival aiport String
                            Text("\(flight.arrivalAirport)")
                                .lineLimit(1)
                                .font(.subheadline)
                            Spacer()
                            Image(systemName: "airplane")
                                .resizable()
                                .frame(width: 15,height: 15)
                                .rotationEffect(.degrees(-90))
                        }
                        HStack {
                            //MARK: Departure airport String
                            Text("\(flight.departureAirport)")
                                .lineLimit(1)
                                .font(.subheadline)
                            Spacer()
                            Image(systemName: "mappin")
                                .resizable()
                                .frame(width: 7,height: 20)
                                .padding(3)
                        }
                    }.padding(10)
                }
                .background(Color.white) // White background for each item
            }
        }
        .cornerRadius(10)
        .padding(20)
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("Histórico de Voos")
        .onAppear {
            flightViewModelVar.fetchFlights()
        }
    }
    
    // MARK: ID Condition
    var filteredFlights: [FlightModel] {
        if searchTerm.isEmpty {
            return flightViewModelVar.filteredFlights
        } else {
            return flightViewModelVar.filteredFlights.filter { flight in
                flight.flightId.contains(searchTerm)
            }
        }
    }
}
