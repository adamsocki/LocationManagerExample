//
//  ContentView.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationViewModel = LocationViewModel()
    @Binding var eventRecords: [EventRecord]
    let saveAction: ()-> Void
    @Environment(\.scenePhase) private var scenePhase
    
    
    var body: some View {
        
        switch locationViewModel.authorizationStatus {
        case .notDetermined:
            AnyView(RequestLocationView())
                .environmentObject(locationViewModel)
        case .restricted:
            ErrorView(errorText: "Location Use is restricted")
        case .denied:
            ErrorView(errorText: "The app does not have location permissions. Please enable them in settings")
        case .authorizedAlways, .authorizedWhenInUse:
            TrackingView(eventRecord: $eventRecords)
                .environmentObject(locationViewModel)
                .padding()
                .onChange(of: scenePhase) {phase in
                    if phase == .background {saveAction() }
                }
//                .onAppear()
//                .onChange(of: scenePhase) { phase in
//                    if phase == .inactive { saveAction() }
//                }
            // .environmentObject(locationViewModel)
        default:
            Text("Unexpected Status.")
        }
        
        
            
    
    
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(eventRecords: .constant(EventRecord.sampleData), saveAction: {})
    }
}
