//
//  LocationManagerExampleApp.swift
//  LocationManagerExample
//
//  Created by Adam Socki on 6/6/22.
//

import SwiftUI

@main
struct LocationManagerExampleApp: App {
    
    @StateObject private var store = EventStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(eventRecords: $store.eventRecords) {
                    EventStore.save(eventRecords: store.eventRecords) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            
            .onAppear {
                // load the store data.
                EventStore.load { result in
                    switch result {
                    case .failure(let error):
                        print(error)
                        //fatalError(error.localizedDescription)
                    case .success(let eventRecords):
                        store.eventRecords = eventRecords
                    }
                }
            }
        }
    }
}
